#!/usr/bin/env python3
#
# A buggy web service in need of a database.

from flask import Flask, request, redirect, url_for, render_template
from flask import Markup
import pandas as pd
import numpy as np

from brewasisdb import get_data, add_products, add_sales, add_clients, add_sales_mined, if_exist

app = Flask(__name__)


# HTML template data
POST = '''
    <table id="table"> <tr> <td style = "width:100px">%s</td> <td style="width:200px">%s</td> <td>%s</td> </tr> </table>
'''
sales_temp = '''
    <table id="table"> <tr> <td style = "width:100px">%s</td> <td style="width:200px">%s</td> <td>%s</td> </tr> </table>
'''
clients_temp = '''
    <table id="table"> <tr> <td style = "width:30px">%s</td> <td style="width:200px">%s</td> <td style="width:220px">%s</td> <td style="width:150px">%s</td><td>%s</td></tr> </table>
'''
sales_mined_temp = '''
    <table id="table"> <tr> <td style = "width:220px">%s</td> <td style="width:120px">%s</td> <td style="width:150px">%s</td> <td style="width:150px">%s</td><td>%s</td></tr> </table>
'''
labels = [
    'JAN', 'FEB', 'MAR', 'APR',
    'MAY', 'JUN', 'JUL', 'AUG',
    'SEP', 'OCT', 'NOV', 'DEC'
]

@app.route('/products', methods=['GET'])
def products_get():
  query_products = "select id, price, name \
                            from products \
                            order by id"
  product_data = "".join(POST % (id, price, name) for id, price, name in get_data(query_products))
  return render_template("products.html", product_data = product_data)

@app.route('/products', methods=['POST'])
def products_post():
  id = request.form['id']
  price = request.form['price']
  product_name = request.form['product_name']
  add_products(id, price, product_name)
  return redirect(url_for('products_get'))

@app.route("/sales", methods=['GET'])
def sales_get():
  query_sales = "select id, sale_date, count \
                        from sales \
                        order by id"
  sales_data = "".join(sales_temp % (s_id, sale_date, count) for s_id, sale_date, count in get_data(query_sales))
  return render_template("sales.html", sales_data = sales_data)

@app.route('/sales', methods=['POST'])
def sales_post():
  s_id = request.form['s_id']
  sale_date = request.form['sale_date']
  count = request.form['count']
  add_sales(s_id, sale_date, count)
  return redirect(url_for('sales_get'))

@app.route("/chart")
def graph():
  query_graph = "select sum(count * price) as value \
                        from sales, products \
                        where products.id=sales.id \
                        group by extract(month from sales.sale_date) \
                        order by extract(month from sales.sale_date)"
  line_labels=labels
  line_values=[item for item, in get_data(query_graph)]
  return render_template('chart.html', title='Monthly Beer Sales', max=200, labels=line_labels, values=line_values)

@app.route("/clients", methods=['GET'])
def clients_get():
  #data_xls = pd.read_excel('jkbg2017sales_mined.xlsx', 'Recreational', index_col=None)
  #data_xls.to_csv('csvfile.csv', encoding='utf-8', index=False)
  if if_exist('clientsdb')[0][0] == False:
      data_xls = pd.read_excel('jkbg2017sales_mined.xlsx', sheet_name = ['Recreational', 'Medical'], index_col=None, header = 1)
      df = pd.concat(data_xls[frame] for frame in data_xls.keys())
      df_clients = df.iloc[:,[0,8,9,11]]
      df_clients = df_clients.drop_duplicates()
      df_clients.rename(columns = lambda x: x.strip().lower().replace(" ", "_"), inplace=True)
      for index, row in df_clients.iterrows():
          add_clients(row['buyer_name'], row['bill_street'], row['bill_city'], row['buyer_licenses'])
  query_clients = "select client_id, buyer_name, bill_street, bill_city, buyer_licenses \
                        from clientsdb \
                        order by client_id"
  clients_data = "".join(clients_temp % (c_id, buyer_name, bill_street, bill_city, buyer_licenses) for c_id, buyer_name, bill_street, bill_city, buyer_licenses in get_data(query_clients))
  return render_template("clients.html", clients_data = clients_data)

@app.route("/sales_mined", methods=['GET'])
def sales_mined_get():
  if if_exist('sales_mined')[0][0] == False:
    data_xls = pd.read_excel('jkbg2017sales_mined.xlsx', sheet_name = ['Recreational', 'Medical'], index_col=None, header = 1)
    df = pd.concat(data_xls[frame] for frame in data_xls.keys())
    df['Date of Order'] = pd.to_datetime(df['Date of Order'])
    df['Total'] = df['Total'].astype(float)
    df_sales_mined = df.iloc[:,[0,3,4,6,7]]
    df_sales_mined = df_sales_mined.drop_duplicates()
    df_sales_mined.rename(columns = lambda x: x.strip().lower().replace(" ", "_"), inplace=True)
    for index, row in df_sales_mined.iterrows():
        add_sales_mined(row['buyer_name'], row['classification'], row['date_of_order'], row['product_count'], row['total'])
  query_sales_mined = "select buyer_name, classification, date_of_order, product_count, total \
                        from sales_mined \
                        order by date_of_order"
  sales_mined_data = "".join(sales_mined_temp % (buyer_name, classification, date_of_order, product_count, total) for buyer_name, classification, date_of_order, product_count, total in get_data(query_sales_mined))
  return render_template("sales_mined.html", sales_mined_data = sales_mined_data)

@app.route("/chart_sales")
def graph_sales():
  query_graph = "SELECT SUM(total) AS total \
                        FROM sales_mined \
                        WHERE extract(year from date_of_order)=2017 \
                        GROUP BY date_trunc('month', date_of_order) \
                        ORDER BY date_trunc('month', date_of_order)"
  line_labels=labels
  line_values=[item for item, in get_data(query_graph)]
  return render_template('chart.html', title='Sales 2017', max=35000, labels=line_labels, values=line_values)

@app.route('/')
def main():
	return render_template('index.html')

if __name__ == '__main__':
  app.run("0.0.0.0", "6060")
