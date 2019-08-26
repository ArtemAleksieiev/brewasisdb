# "Database code"

import os
import psycopg2


DATABASE_URL = "brewasis"

def get_data(query):
  """Return data from the database."""
  db = psycopg2.connect(database = DATABASE_URL)
  c = db.cursor()
  c.execute(query)
  return c.fetchall()
  db.close()

def add_products(id,price, product_name):
  db = psycopg2.connect(database = DATABASE_URL)
  c = db.cursor()
  c.execute("insert into products values (%s, %s, %s)", (id, price, product_name))
  db.commit()
  db.close()

def add_sales(s_id, sale_date, count):
  db = psycopg2.connect(database = DATABASE_URL)
  c = db.cursor()
  c.execute("insert into sales values (%s, %s, %s)", (s_id, sale_date, count))
  db.commit()
  db.close()

def add_clients(buyer_name, bill_street, bill_city, buyer_licenses):
  db = psycopg2.connect(database = DATABASE_URL)
  c = db.cursor()
  c.execute("insert into clientsdb values (DEFAULT, %s, %s, %s, %s)", (buyer_name, bill_street, bill_city, buyer_licenses))
  db.commit()
  db.close()

def add_sales_mined(buyer_name, classification, date_of_order, product_count, total):
  db = psycopg2.connect(database = DATABASE_URL)
  c = db.cursor()
  c.execute("insert into sales_mined values (%s, %s, %s, %s, %s)", (buyer_name, classification, date_of_order, product_count, total))
  db.commit()
  db.close()

def if_exist(table_name):
  db = psycopg2.connect(database = DATABASE_URL)
  c = db.cursor()
  c.execute("select exists (select * from %s)" % table_name)
  return c.fetchall()
  db.close()
