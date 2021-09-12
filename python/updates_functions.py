from sqlite3.dbapi2 import Error
import pandas as pd
import yfinance as yf
import datetime as dt
import requests

yf.pdr_override()

def get_yahoo_price(conn, table):
    cursor = conn.cursor()

    app_list = pd.read_sql_query(f"SELECT ticker FROM {table} ORDER BY ticker", conn)
    app_list['ticker'] = app_list['ticker'].astype(str) + '.SA' 
    app_list = app_list["ticker"].astype(str).tolist()
    # print(app_list)

    yahoo_df = yf.download(app_list, period="1min")["Adj Close"]
    yahoo_df = yahoo_df.T.reset_index()
    yahoo_df.columns = ["ticker",  "price"] # , "valor_duplicado" (As vezes 2 as vezes 3)
    yahoo_df['ticker'] = yahoo_df['ticker'].map(lambda x: x.rstrip('.SA'))
    yahoo_df = yahoo_df.set_index('ticker')
    # print(yahoo_df)

    app_df = pd.read_sql_query(f"SELECT ticker, price FROM {table} ORDER BY ticker", conn, index_col="ticker")
    # print(app_df)

    for index, row in app_df.iterrows():
        app_df.loc[index]['price'] = yahoo_df.loc[index]['price']
    # print(app_df)

    for index, row in app_df.iterrows():
        query = f"Update {table} set price = ? where ticker = ?"
        params = (row['price'], index,)
        cursor.execute(query, params)
    conn.commit()
        
    # cursor.close()
    # conn.close()

    print(f'updated {table} with success')

def get_derivatives_price(conn, table):
    cursor = conn.cursor()

    app_derivatives = pd.read_sql_query(f"SELECT ticker, price FROM {table} ORDER BY ticker", conn, index_col="ticker")
    # print(app_derivatives)

    url = 'https://www.tradergrafico.com.br/opcoes/'
    header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
    r = requests.get(url, headers=header)
    tradergrafico_derivatives = pd.read_html(r.text,  decimal=',', thousands='.')[0]
    tradergrafico_derivatives = tradergrafico_derivatives.drop([0, 2, 3, 5, 6], axis=1).drop([0,1])
    tradergrafico_derivatives.columns = ["ticker", "price"]
    tradergrafico_derivatives = tradergrafico_derivatives.set_index('ticker')
    tradergrafico_derivatives['price'] = tradergrafico_derivatives['price'].str[3:]
    tradergrafico_derivatives['price'] = tradergrafico_derivatives['price'].str.replace(',', '.')
    # print(tradergrafico_derivatives.head())


    for index, row in app_derivatives.iterrows():
        try:
            app_derivatives.loc[index]['price'] = tradergrafico_derivatives.loc[index]['price']
        except Exception as e:
            # print(f' Key Exception - {e}')
            pass

    # print(app_derivatives)

    for index, row in app_derivatives.iterrows():
        query = f"Update {table} set price = ? where ticker = ?"
        params = (row['price'], index,)
        cursor.execute(query, params)
    conn.commit()
        
    # cursor.close()
    # conn.close()

    print(f'updated {table} with success')
