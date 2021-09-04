import sqlite3
import pandas as pd
import warnings
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

app_puts = pd.read_sql_query("SELECT ticker, strike, price FROM Puts ORDER BY ticker", conn, index_col="ticker")
# print(app_puts)

url = 'https://www.tradergrafico.com.br/opcoes/'
header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
r = requests.get(url, headers=header)
tradergrafico_puts = pd.read_html(r.text,  decimal='.', thousands=',')[0]
tradergrafico_puts = tradergrafico_puts.drop([0, 2, 5, 6], axis=1).drop([0,1])
tradergrafico_puts.columns = ["ticker","strike","price"]
tradergrafico_puts = tradergrafico_puts.set_index('ticker')
tradergrafico_puts['price'] = tradergrafico_puts['price'].str[3:]
tradergrafico_puts['price'] = tradergrafico_puts['price'].str.replace(',', '.')
tradergrafico_puts['strike'] = tradergrafico_puts['strike'].str[3:]
tradergrafico_puts['strike'] = tradergrafico_puts['strike'].str.replace(',', '.')

# print(tradergrafico_puts.head())

for index, row in app_puts.iterrows():
    app_puts.loc[index]['price'] = tradergrafico_puts.loc[index]['price']
# print(app_puts)

for index, row in app_puts.iterrows():
    query = f"Update Puts set price = ? where ticker = ?"
    params = (row['price'], index,)
    cursor.execute(query, params)

for index, row in app_puts.iterrows():
    app_puts.loc[index]['strike'] = tradergrafico_puts.loc[index]['strike']
# print(app_puts)

for index, row in app_puts.iterrows():
    query = f"Update Puts set strike = ? where ticker = ?"
    params = (row['strike'], index,)
    cursor.execute(query, params)

conn.commit()
    
cursor.close()
conn.close()

print('updated puts with success')
