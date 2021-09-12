import sqlite3
import pandas as pd
import warnings
import datetime as dt
import yfinance as yf
yf.pdr_override()

warnings.filterwarnings('ignore')

import requests


def create_connection(db_file):
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Exception as e:
        print(e)
    return conn

conn = create_connection('../db/development.sqlite3')

cursor = conn.cursor()

app_br_stocks_list = pd.read_sql_query("SELECT ticker FROM br_stocks ORDER BY ticker", conn)
app_br_stocks_list['ticker'] = app_br_stocks_list['ticker'].astype(str) + '.SA' 
app_br_stocks_list = app_br_stocks_list["ticker"].astype(str).tolist()
# print(app_br_stocks_list)

yahoo_br_stocks = yf.download(app_br_stocks_list, period="1min")["Adj Close"]
yahoo_br_stocks = yahoo_br_stocks.T.reset_index()
yahoo_br_stocks.columns = ["ticker",  "price"] # , "valor_duplicado" (As vezes 2 as vezes 3)
yahoo_br_stocks['ticker'] = yahoo_br_stocks['ticker'].map(lambda x: x.rstrip('.SA'))
yahoo_br_stocks = yahoo_br_stocks.set_index('ticker')
# print(yahoo_br_stocks)

app_br_stocks = pd.read_sql_query("SELECT ticker, price FROM br_stocks ORDER BY ticker", conn, index_col="ticker")
# print(app_br_stocks)

for index, row in app_br_stocks.iterrows():
    app_br_stocks.loc[index]['price'] = yahoo_br_stocks.loc[index]['price']
# print(app_br_stocks)

for index, row in app_br_stocks.iterrows():
    query = f"Update br_stocks set price = ? where ticker = ?"
    params = (row['price'], index,)
    cursor.execute(query, params)
conn.commit()
    
cursor.close()
conn.close()

print('updated br_stocks with success')