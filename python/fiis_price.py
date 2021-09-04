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

app_fiis_list = pd.read_sql_query("SELECT ticker FROM Fiis ORDER BY ticker", conn)
app_fiis_list['ticker'] = app_fiis_list['ticker'].astype(str) + '.SA' 
app_fiis_list = app_fiis_list["ticker"].astype(str).tolist()
# print(app_fiis_list)

yahoo_fiis = yf.download(app_fiis_list, period="1min")["Adj Close"]
yahoo_fiis = yahoo_fiis.T.reset_index()
yahoo_fiis.columns = ["ticker",  "price"] # , "valor_duplicado" (As vezes 2 as vezes 3)
yahoo_fiis['ticker'] = yahoo_fiis['ticker'].map(lambda x: x.rstrip('.SA'))
yahoo_fiis = yahoo_fiis.set_index('ticker')
# print(yahoo_fiis)

app_fiis = pd.read_sql_query("SELECT ticker, price FROM Fiis ORDER BY ticker", conn, index_col="ticker")
# print(app_fiis)

for index, row in app_fiis.iterrows():
    app_fiis.loc[index]['price'] = yahoo_fiis.loc[index]['price']
# print(app_fiis)

for index, row in app_fiis.iterrows():
    query = f"Update Fiis set price = ? where ticker = ?"
    params = (row['price'], index,)
    cursor.execute(query, params)
conn.commit()
    
cursor.close()
conn.close()

print('updated fiis with success')