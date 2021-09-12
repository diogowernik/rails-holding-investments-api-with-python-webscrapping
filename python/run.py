import sqlite3
import warnings

import updates_functions as uf
import time

warnings.filterwarnings('ignore')

def create_connection(db_file):
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Exception as e:
        print(e)
    return conn

conn = create_connection('../db/development.sqlite3')

while True:
    

    uf.get_yahoo_price(conn, 'br_stocks')
    uf.get_yahoo_price(conn, 'fiis')
    uf.get_derivatives_price(conn, 'calls')
    uf.get_derivatives_price(conn, 'puts')

    print('próxima atualização em 5 minutos')
    time.sleep(300)
