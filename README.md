# CocoTrace: A Product Traceability App


# PostgreSQL set up

- Install postgreSQL 

In the terminal : 
- sudo -u postgres createuser admin
- sudo -u postgres createdb cocotrace
- sudo -u postgres psql
  psql=# alter user admin with encrypted password 'admin';
- psql=# grant all privileges on database cocotrace to admin ;
- Don't forget to add the data in 'data.sql' file. Go on http://127.0.0.1:62467/browser/ and execute SQL queries in Query tool (right click on cocotrace database)
