# CocoTrace: A Product Traceability App

## Table of Contents

1. [Table of Contents](#Table-of-Contents)
1. [Team Members](#team-members)
1. [About the project](#about-the-project)
1. [PostgreSQL set up](#postgresql-set-up)

## Team Members

1. Titouan Le Mao
2. Cedric Le Mercier
3. Urusha Rajkarnikar
4. Htoo Lwin

## About the project

TBD

## PostgreSQL set up

- Install postgreSQL for development

In the terminal :
- sudo -u postgres createuser admin
- sudo -u postgres createdb cocotrace
- sudo -u postgres psql
  psql=# alter user admin with encrypted password 'admin';
- psql=# grant all privileges on database cocotrace to admin ;
- Don't forget to add the data in 'data.sql' file. Go on http://127.0.0.1:62467/browser/ and execute SQL queries in Query tool (right click on cocotrace database)
