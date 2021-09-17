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



url = 'https://coinmarketcap.com/all/views/all/'
header = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36"}
r = requests.get(url, headers=header)

coingecko_criptos = pd.read_html(r.text,  decimal='.')[0]
# coingecko_criptos["Preço"].replace("$ ", "", regex=True)
# coingecko_criptos = coingecko_criptos[['Moeda', 'Preço']]
print(coingecko_criptos)

