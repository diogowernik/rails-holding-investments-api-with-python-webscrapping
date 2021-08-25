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
cursor.execute("SELECT ticker FROM 'Criptos'")
my_criptos = cursor.fetchall()
print(my_criptos)

url = 'https://www.coingecko.com/pt'
header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
r = requests.get(url, headers=header)

coingecko_criptos = pd.read_html(r.text,  decimal='.')[0]
# coingecko_criptos["Preço"].replace("$ ", "", regex=True)
coingecko_criptos = coingecko_criptos[['Moeda', 'Preço']]
print(coingecko_criptos)

