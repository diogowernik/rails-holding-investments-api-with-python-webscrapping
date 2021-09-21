

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



url = 'https://www.fundsexplorer.com.br/ranking'
header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
r = requests.get(url, headers=header)

fiis = pd.read_html(r.text,  decimal=',')[0]
fiis= fiis[['Códigodo fundo','QuantidadeAtivos']]
fiis.columns = ['ticker', 'assets']
fiis['assets'] = pd.to_numeric(fiis['assets'])
# fiis['assets'] = fiis['assets'].str[3:]
fiis = fiis.set_index('ticker')
print(fiis)

app_fiis = pd.read_sql_query(f"SELECT ticker, assets FROM Fiis ORDER BY ticker", conn, index_col="ticker")
print(app_fiis)

for index, row in app_fiis.iterrows():
    try:
        app_fiis.loc[index]['assets'] = fiis.loc[index]['assets']
    except Exception as e:
        print(f' Key Exception - {e}')
        pass 

print(app_fiis)

for index, row in app_fiis.iterrows():
    query = f"Update Fiis set assets = ? where ticker = ?"
    params = (row['assets'], index)
    cursor.execute(query, params)
conn.commit()




