# 333DB
This project is build based on Ruby on Rails and MS SQL server. We created the database in the titan.csse.rose-hulman.edu as Graduate_School. 

To run this application, Ruby on Rails needs to be installed. The instructions can be found in the following link.
http://railsinstaller.org/en

After the installation, users can download the source code. Before running the server, execute:
```
bundle install
```
in command line so that all necessary gems required in the system can be installed properly.

Then, to execute the server, execute:
```
rails server
```

The database script is also in this folder. 

To connect the front end and back end database, users can change the database.yml file in 333DB/config using following format for development, test, and production.

```
  adapter: sqlserver
  database: <database name>
  username: <database login username>
  password: <database login password>
  host: titan.csse.rose-hulman.edu <or other host for the MS SQL server>
```

Ruby on Rails default on using the SQLite database. And it is also compatible with MySQL database. Similar setup can be done in the database.yml file in the location above.

All database script required to create the database can be found in the .sql files in this repository. 

Regarding a guide for Ruby on Rails, here is the link: 
http://guides.rubyonrails.org/
