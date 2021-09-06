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

app_calls = pd.read_sql_query("SELECT ticker, price FROM Calls WHERE is_disable = false ORDER BY ticker", conn, index_col="ticker")
print(app_calls)

url = 'https://www.tradergrafico.com.br/opcoes/'
header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
r = requests.get(url, headers=header)
tradergrafico_calls = pd.read_html(r.text,  decimal=',', thousands='.')[0]
tradergrafico_calls = tradergrafico_calls.drop([0, 2, 3, 5, 6], axis=1).drop([0,1])
tradergrafico_calls.columns = ["ticker", "price"]
tradergrafico_calls = tradergrafico_calls.set_index('ticker')
tradergrafico_calls['price'] = tradergrafico_calls['price'].str[3:]
tradergrafico_calls['price'] = tradergrafico_calls['price'].str.replace(',', '.')
# print(tradergrafico_calls.head())

for index, row in app_calls.iterrows():
    app_calls.loc[index]['price'] = tradergrafico_calls.loc[index]['price']
# print(app_calls)

for index, row in app_calls.iterrows():
    query = f"Update Calls set price = ? where ticker = ?"
    params = (row['price'], index,)
    cursor.execute(query, params)
conn.commit()
    
cursor.close()
conn.close()

print('updated calls with success')
