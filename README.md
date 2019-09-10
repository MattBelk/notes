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

You can use a deployed version of the app on (Heroku)[https://morning-shore-44509.herokuapp.com/].

To get started with the app in a local server, you'll need to have Ruby/Rails 
installed. Clone the repo and then install gems using:

```
$ bundle install --without production
```

Next, migrate and then seed the database:

```
$ bin/rails db:migrate
$ bin/rails db:seed
```

Then run the test suite to verify that everything is working:

```
$ bin/rails test
```

If the test suite passes, you can run the app in a local server:

```
$ bin/rails server
```

## Note for Sendgrid with Heroku

The config file at /config/environments/production.rb currently sets Heroku to 
use Sendgrid through an API key.

To make this work, you need to generate an API key with Sendgrid (accounts are 
free to set up) and then set the Heroku config var SENDGRID_API_KEY to this key.

You'll also need to change the host in this same file, and change the domain if 
not using Heroku.

## Note about images with ActionText

By default, ActiveStorage (used by ActionText) uses local storage for images. 
This means that on Heroku, any image attached to a note will not persist. In an 
actual app, you could use a cloud file storage service such as Amazon's S3 to 
store these files instead.