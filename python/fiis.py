import sqlite3
import pandas as pd
import warnings
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

cursor.row_factory = lambda cursor, row: row[0]
# cursor.execute("SELECT ticker, price FROM Fiis")
# my_fiis = cursor.fetchall()
# print(my_fiis)






url = 'https://www.fundsexplorer.com.br/ranking'
header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
r = requests.get(url, headers=header)

fund_explorer_fiis = pd.read_html(r.text,  decimal='.', thousands='.')[0]
fund_explorer_fiis = fund_explorer_fiis[['Códigodo fundo', 'Preço Atual']]
fund_explorer_fiis.columns = ["ticker", "price"]
fund_explorer_fiis = fund_explorer_fiis.set_index('ticker')
fund_explorer_fiis["price"].replace("R$ ", "", regex=True)


print(fund_explorer_fiis)


holding_fiis = pd.read_sql_query("SELECT ticker, price FROM Fiis ORDER BY ticker", conn, index_col="ticker")

print(holding_fiis)

for index, row in holding_fiis.iterrows():
    holding_fiis.loc[index]['price'] = fund_explorer_fiis.loc[index]['price']

for index, row in holding_fiis.iterrows():
    query = f"Update Fiis set price = ? where ticker = ?"
    params = (row['price'], index,)
    cursor.execute(query, params)

print(holding_fiis)

conn.commit()
    
cursor.close()
conn.close()