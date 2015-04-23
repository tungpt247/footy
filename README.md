#Setup environment
	Requirements
	  Rails version: 4.2.0
  
	  Ruby version: 2.2.0
  
	  Postgres database version: 9.4.0

###Create rails app
	$ bundle exec rails new <your name app>


###Config Rspec
  
	$ bundle exec rails generate rspec:install

###Config Guard

	$ bundle exec guard init

###Config Cucumber, Capybara, Poltergeist for acceptance testing
	1. Update phantomjs
		$ brew update && brew install phantomjs

	2. Bootstrap Cucumber in Rails
		$ bundle exec rails generate cucumber:install

Register Capybara driver :poltergeist in features/support/env.rb

	  require 'rspec'
	  require 'capybara/poltergeist'
	  require 'cucumber/rails'

	  # Capybara configuration use poltergeist driver
	  Capybara.default_wait_time = 8
	  Capybara.register_driver :poltergeist do |app|
	    options = {
	      :js_errors => false,
	      :timeout => 120,
	      :debug => false,
	      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
	      :inspector => true
	    }

	    Capybara::Poltergeist::Driver.new(app, options)
	  end

	  Capybara.javascript_driver = :poltergeist

###Make database for testing

	bundle exec rake db:migrate RAILS_ENV=test

###Automation testing
Run just cucumber
  
	$ bundle exec cucumber features/

Run just rspec

	$ bundle exec rspec spec/

To monitor tests running

	$ bundle exec guard


###Add delayed job
	add gem 'delayed_job_active_record'
	$ rails g delayed_job:active_record
	$ rake db:migrate

###Integation testing with Travis CI



#Setup on Heroku


#### Setting environment on Heroku intead commit .env file
  $ heroku config:set SAYNEWS_DATABASE_PASSWORD=xxx --app liveinfo

### Setting database
  Automation run migrate during deployment to heroku with buildpacks


Finally, if you want a way to get a shortcut to gems in your bundle:
bundle install --binstubs



	
#Mina deploy
env = staging | production

Setup

	$ mina setup on=env

Delpoy

	$ mina deploy on=env 



#ISSUES

Removes the deploy lock file.

	$ mina deploy:force_unlock
	

	