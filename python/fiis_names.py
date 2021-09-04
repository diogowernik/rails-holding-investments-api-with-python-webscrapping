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







url = 'https://www.clubefii.com.br/fundo_imobiliario_lista'
header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
r = requests.get(url, headers=header)

clubefii_fiis = pd.read_html(r.text,  decimal='.', thousands='.')[0]
clubefii_fiis = clubefii_fiis[['CÓDIGO', 'NOME']]
clubefii_fiis.columns = ["ticker", "title"]
clubefii_fiis = clubefii_fiis.set_index('ticker')
print(clubefii_fiis)

app_fiis = pd.read_sql_query("SELECT ticker, title FROM Fiis ORDER BY ticker", conn, index_col="ticker")
# print(app_fiis)

for index, row in app_fiis.iterrows():
    app_fiis.loc[index]['title'] = clubefii_fiis.loc[index]['title']
# print(app_fiis)

for index, row in app_fiis.iterrows():
    query = f"Update Fiis set title = ? where ticker = ?"
    params = (row['title'], index,)
    cursor.execute(query, params)
conn.commit()
    
cursor.close()
conn.close()

print('updated fiis from clubefii with success')
