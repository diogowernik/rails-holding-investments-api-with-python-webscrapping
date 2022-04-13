import sqlite3
import warnings
from datetime import datetime

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
    

    
    uf.get_yahoo_price(conn, 'fiis')
    uf.get_yahoo_price(conn, 'br_stocks')
    uf.get_criptos_price(conn, 'criptos')

    # uf.get_derivatives_price(conn, 'calls')
    # uf.get_derivatives_price(conn, 'puts')
    
    uf.update_total_today(conn, 'fiis', 'portfolio_fiis', 'fii_id')
    uf.update_total_today(conn, 'br_stocks', 'portfolio_br_stocks', 'br_stock_id')
    uf.update_total_today(conn, 'criptos', 'portfolio_criptos', 'cripto_id')

    uf.update_fiis_table(conn, 'last_dividend')
    uf.update_fiis_table(conn, 'last_yield')
    uf.update_fiis_table(conn, 'six_m_yield')
    uf.update_fiis_table(conn, 'twelve_m_yield')
    uf.update_fiis_table(conn, 'p_vpa')

    print("Ultima Atualização:")
    print(datetime.now())
    print('Próxima atualização em 15 minutos')
    time.sleep(900)
