# 333DB
This project is build based on Ruby on Rails and MS SQL server. We created the database in the titan.csse.rose-hulman.edu as Graduate_School. 

The database script is also in this folder. 

To connect the front end and back end database, users can change the database.yml file in 333DB/config using following format for development, test, and production.

  adapter: sqlserver
  database: <database name>
  username: <database login username>
  password: <database login password>
  host: titan.csse.rose-hulman.edu <or other host for the MS SQL server>

