# README

## Basic notes app made using Rails. It has: 
* A test suite using 
[Minitest](https://github.com/seattlerb/minitest) and
[Capybara](https://github.com/teamcapybara/capybara) (driven by Selenium),
with basic automation using
[Guard](https://github.com/guard/guard).
* User authentication, email confirmation/recovery, etc... using 
[Devise](https://github.com/plataformatec/devise);
* A sortable grid interface for notes using 
[Masonry](https://masonry.desandro.com/) together with 
[jQuery UI](https://jqueryui.com/sortable/);
* Rich text notes with 
[ActionText](https://edgeguides.rubyonrails.org/action_text_overview.html);
* Mailers for the Devise confirmation/recovery using 
[SendGrid](https://sendgrid.com/);

## Ruby/Rails versions
* Ruby version - 2.6.3
* Rails version - 6.0.0

## Getting started

Things you may want to cover:

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Note for Sendgrid with Heroku

The config file at /config/environments/production.rb currently sets Heroku to 
use Sendgrid through an API key.

To make this work, you need to generate an API key with Sendgrid (accounts are 
free to set up) and then set the Heroku config var SENDGRID_API_KEY to this key.

You'll also need to change the host in this same file, and change the domain if 
not using Heroku.