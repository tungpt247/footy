source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'dotenv-rails', '~> 2.0.1'
gem 'pg', '~> 0.18.1'

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.4.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim-rails', '~> 3.0.1'
gem 'jquery-rails'

gem 'simple_form'
# wysihtml ui
gem 'bootstrap-wysihtml5-rails', '~> 0.3.3.6'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'geocoder', '~> 1.2.8' # geographic coordinates

# authen & authorization
gem 'devise', '~> 3.4.1'

# unicorn as the app server
gem 'unicorn', '~> 4.8.3'

# Background job for active record
gem 'daemons', '~> 1.2.2'
gem 'delayed_job_active_record', '~> 4.0.3'
gem 'whenever', '~> 0.9.4', :require => false

gem 'mini_magick'

# Memcached
gem 'dalli'

group :development do
  # use mina deploy
  gem 'mina', '~> 0.3.4'
  gem 'mina-nginx', :require => false
  gem 'mina-unicorn', :require => false
  gem 'mina-multistage', require: false
  gem 'mina-delayed_job', '~> 0.0.1', require: false
  gem 'mina-rsync', :require => false
  gem 'god', :require => false

  # convert erb to slim template
  gem  'html2slim'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.2.1'
  gem 'factory_girl_rails', '~> 4.5.0' # factory definition loading
  gem 'guard', '~> 2.12.4'
  gem "guard-rspec", '~> 4.5.0', require: false
  gem 'guard-cucumber', '~> 1.5.4'
  gem 'rb-fsevent'
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'cucumber-api-steps', '~> 0.13'
  gem 'test-queue', '~> 0.2.12'
end

group :test do
  gem 'faker'
  gem 'minitest'
  gem 'cucumber-rails', '~> 1.4.2', require: false
  gem 'capybara', '~> 2.4.4'
  gem 'capybara-screenshot', '~> 1.0.7' # capture screen shot during testing
  gem 'shoulda-matchers'
  # gem 'shoulda-callback-matchers'
  gem 'rspec-collection_matchers'
  gem 'launchy', '~> 2.4.3' # this lets us call save_and_open_page to see what's on a page for debugging
  gem 'poltergeist', '~> 1.6.0'
  gem 'selenium-webdriver', '~> 2.45.0'

  gem 'database_cleaner'
end

