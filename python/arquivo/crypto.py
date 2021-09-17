
import requests
import json
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

app_criptos_list = pd.read_sql_query("SELECT slug FROM criptos ORDER BY slug", conn)
app_criptos_list = app_criptos_list["slug"].tolist()
app_criptos_list = ','.join(app_criptos_list)
# print(app_criptos_list)

criptos_price = pd.read_json(f'https://api.coingecko.com/api/v3/simple/price?ids={app_criptos_list}&vs_currencies=brl').T.reset_index()
criptos_price.columns = ["slug", "price"]
criptos_price = criptos_price.set_index('slug')
# print(criptos_price)

app_criptos = pd.read_sql_query(f"SELECT slug, price FROM criptos ORDER BY slug", conn, index_col="slug")
# print(app_criptos)

for index, row in app_criptos.iterrows():
    app_criptos.loc[index]['price'] = criptos_price.loc[index]['price']
# print(app_criptos)

for index, row in app_criptos.iterrows():
    query = f"Update criptos set price = ? where slug = ?"
    params = (row['price'], index,)
    cursor.execute(query, params)
conn.commit()










# def cripto(coin):
#     x = requests.get(f'https://api.coingecko.com/api/v3/simple/price?ids={coin}&vs_currencies=brl')
#     return json.loads(x.text)
#     # print(x.text)


# for coin in app_criptos_list:
#     try:
#         result = cripto(coin)
#         coin_data = result[coin]
#         coin_table = pd.read_json('coin_data')

#         # print(f'{coin} | {coin_data["brl"]}')
#         # print(coin_data)
#         print(cripto(coin))
#     except Exception as e:
#         print(f' Key Exception - {e}')
#         pass

    

