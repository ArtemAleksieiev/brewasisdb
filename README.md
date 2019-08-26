# brewasisdb
Python Postgresql database

This project uses Postgres database and allow users add items in two tables: products and sales.
Then the result graphically shows the change in sales by month. Database contain two tables:
* Products

    Include these columns:
     - id(primary key)
     - price
     - name
* Sales

    Include these columns:
     - id
     - date
     - count



  ## Steps you need to run these code
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
See deployment for notes on how to deploy the project on a live system.

  Install the required software:

- a. Virtual Machine: https://www.virtualbox.org/wiki/Downloads
- b. Vagrant: https://www.vagrantup.com/downloads.html
- c. Download this project as zip file, extract the files and using command line, input the following commands:
```
vagrant up
vagrant ssh
cd /vagrant
```

Once you're ready, input these command:
```
python app.py
```
The project should be executed and now you can browse the main page by going to your internet browser and enter the url: http://localhost:6060/

To view and update the products table you can use the following url: http://localhost:6060/products

To view and update the sales table you can use the following url: http://localhost:6060/sales

To view the chart you can use the following url: http://localhost:6060/chart
