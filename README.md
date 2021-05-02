# CocoTrace: A Product Traceability App

## Table of Contents

1. [Table of Contents](#Table-of-Contents)
1. [Team Members](#team-members)
1. [About the project](#about-the-project)
1. [PostgreSQL set up](#postgresql-set-up)
1. [Running the app](#running-the-app)
1. [Deploying to production on Heroku](#Deploying-to-production-on-Heroku)
1. [Deploying the LIFF App](#deploying-the-liff-app)

## Team Members

1. Titouan Le Mao
2. Cedric Le Mercier
3. Urusha Rajkarnikar
4. Htoo Lwin

## About the project

TBD

## PostgreSQL set up

### Download and install PostgreSQL 13 (for Windows)

Go to https://www.postgresql.org/download/ and follow the instructions for installing. By default, install on port 5432. In the components installation screen, make sure to tick “pgAdmin 4” to install the admin user interface for managing PostgreSQL.

- Create an admin user for database in pgAdmin 4
- By default, the application is configured with the following database admin credentials, either create a user in pgAdmin with these credentials or change application.properties configuration in `./src/main/resources/`

**Note**: Windows users can experience an ‘authentication type 10 error’ during first time setup. Check the [troubleshooting](https://docs.google.com/document/d/1tyB8GpqJVRlsddg53kjPB2YkxhE5wDPqNEUAd2DmbBQ/edit#heading=h.w8hgvu6okr4) section for more information.

```java
spring.datasource.username=admin
spring.datasource.password=admin
```

- Create a table for cocotrace in pgAdmin 4
- Create a database named cocotrace and set the newly created admin user as the Owner

### Linux and MacOS setup

In the terminal :

- sudo -u postgres createuser admin
- sudo -u postgres createdb cocotrace
- sudo -u postgres psql
  psql=# alter user admin with encrypted password 'admin';
- psql=# grant all privileges on database cocotrace to admin ;
- Don't forget to add the data in 'data.sql' file. Go on http://127.0.0.1:62467/browser/ and execute SQL queries in Query tool (right click on cocotrace database)

## Running the app

Run `CocotraceApplication.java` as the main class. During the first run, it should create 6 tables within the cocotrace database and populate the tables with the queries contained in src/main/resources/data.sql.
Visit the application at `http://localhost:8082` and login as an administrator with the default credentials

```java
Username: administrator
Password: administrator
```

If it doesn’t work, there was possibly an error with the queries populating table. Check the troubleshooting section “[Populate the tables with dummy data manually with pgAdmin 4](https://docs.google.com/document/d/1tyB8GpqJVRlsddg53kjPB2YkxhE5wDPqNEUAd2DmbBQ/edit#heading=h.zcr5sg6aqo6t)”.

## Deploying to production on Heroku

To deploy Spring Boot applications to heroku, follow this guide: https://devcenter.heroku.com/articles/deploying-spring-boot-apps-to-heroku

**NOTE**: When publishing the Spring Boot app on Heroku, there is no need to create a database as it will be created automatically

### Populate Heroku database

In some cases, the tables will be created empty and you will need to run the queries manually to add default and dummy data. Get the queries in the [Troubleshooting](https://docs.google.com/document/d/1tyB8GpqJVRlsddg53kjPB2YkxhE5wDPqNEUAd2DmbBQ/edit#heading=h.1uqppt6jhbsj) section.
To connect to Heroku database from CLI, login to Heroku via CLI and run:

`heroku pg: psql`

Then copy paste the SQL queries one by one.
More info on Heroku PostgreSQL and CLI: https://devcenter.heroku.com/articles/heroku-postgresql#using-the-cli

### Setup the environment variables in Heroku

Set up the environment variables for the app to work
For only the webapp:

- `APP_URL`: Put your heroku app URL here (only used to create QR Codes links)
- `DATABASE_URL`: The heroku database url, beginning with postgres://

For LINE Chatbot to work only (If creating your own Dialogflow and LINE chatbot):

- `CHANNEL_TOKEN`: Put the Chatbot MESSAGING API Line channel token here (necessitates a LINE Developer account and create a Chatbot using Messaging API)

- `LIFF_URL`: The LIFF App URL (Check Deploying the LIFF App section).

## Deploying the LIFF App

Current url for the LIFF Application https://cocotrace-liff.herokuapp.com/ 

**Note**: Some functionalities are only available in LINE application, such as scanning QR code)

### Overview

LINE Front-end Framework (LIFF) is a platform for web apps provided by LINE. The web apps running on this platform are called LIFF apps. The LIFF app is what allows the chatbot to access advanced features, such as scanning QR code or getting user profile information.

Clone the repository:

```git
git clone https://github.com/cocostuff/cocotrace-liff
# then run to install dependencies
npm install
```

### Deploy the app on Heroku

Follow the instructions on deploying node.js apps https://devcenter.heroku.com/articles/deploying-nodejs

***
