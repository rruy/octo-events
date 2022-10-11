# Octo Events

This application has objective to receiver call from webhook with origin that creation issues from GitHub this same repo. 

Things you may want to cover:

* Ruby version
  - Ruby 2.7.2
  - Rails 7.0.4
  - Database SQL Lite

* Database creation
  First Time you need run migration to create database and create tables.
  Run this command:
  ```
  rails db:drop db:create db:migrate
  ```

* How to run the test suite
  - Execute this command 
  ```
  rails test
  ```

* Use ngrok

The ngrok allow you app show to internt from your Pc and run local rails running.

To install ngrok on Ubuntu:

~> sudo snap install ngrok

To start ngrok run this command to forward to port rails app:

~> ngrok http 3000

After run ngrok in your terminal should show info similar to:

Forwarding 7e9ea9dc.ngrok.io -> 127.0.0.1:3000

It is now possible to access the internet with the following url created above: 7e9ea9dc.ngrok.io

After this procedure, initialize the rails application pointing to port 4567 so that ngrok can redirect to our application.

~> rails s -p 3000

With this, github can already make calls in the application when a new issue is created in the repository.
