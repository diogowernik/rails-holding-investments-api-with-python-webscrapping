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

portfolio_assets = pd.read_sql_query("SELECT portfolio_fiis.id, fiis.ticker, portfolio_fiis.shares_amount, fiis.price, portfolio_fiis.total_today FROM fiis INNER JOIN portfolio_fiis ON fiis.id=portfolio_fiis.fii_id;", conn , index_col="id")


update_total_today = portfolio_assets["price"] * portfolio_assets["shares_amount"]
portfolio_assets["total_today"] = update_total_today

for index, row in portfolio_assets.iterrows():
    portfolio_assets.loc[index]['total_today'] = portfolio_assets.loc[index]['total_today']
    query = f"Update portfolio_fiis set total_today = ? where id = ?"
    params = (row['total_today'], index,)
    cursor.execute(query, params)
conn.commit()