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

# ui
gem 'bootstrap-wysihtml5-rails', '~> 0.3.3.6'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# unicorn as the app server
gem 'unicorn', '~> 4.8.3'

# Background job for active record
gem 'daemons', '~> 1.2.2'
gem 'delayed_job_active_record', '~> 4.0.3'
gem 'whenever', '~> 0.9.4'

group :development do
  # use mina deploy
  gem 'mina', '~> 0.3.4'
  gem 'mina-nginx', :require => false
  gem 'mina-unicorn', :require => false
  gem 'mina-multistage', require: false
  gem 'mina-delayed_job', '~> 0.0.1', require: false
  gem 'mina-rsync'
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
end

