Campaigner
================
[![Maintainability](https://api.codeclimate.com/v1/badges/625465253f4488107718/maintainability)](https://codeclimate.com/github/niroj/campaigner/maintainability)

This application requires:

- Ruby 3.0.0
- Rails 7.0.1
- postgreSQL database server

Getting Started
---------------
- Step 1: Clone this project to your local directory
- Step 2: Inside project root run `gem install bundler` and then `bundle install`
- Step 3: change database.yml to correctly reflect your local settings
- Step 4: run `rake db:setup`
- Step 5: run `rake db:seed`
- Step 6: start server using `bundle exec rails s`
- Step 7: open localhost:3000 in browser and login using 'expert@campaigner.com' and password 'campaigner'

Note: remove .ruby-gemset file to install gems in global space while doing bundle.

Credits
---------------
[Niroj Shrestha](mailto:nexus.niroj@gmail.com)
