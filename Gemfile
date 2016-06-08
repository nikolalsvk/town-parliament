source 'https://rubygems.org'

gem 'rails', '4.2.4'

# Use PostgreSQL as the database for Active Record
gem 'pg'

# Compressor of JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jQuery as the JavaScript library
gem 'jquery-rails'

# User authentication
gem 'devise', '~> 3.4.0'

gem 'omniauth-facebook'
gem 'kaminari'
gem 'ransack'
gem 'dynamic_form'

group :test, :development do
  gem 'rspec-rails'
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-byebug'
end

group :development do
  gem 'chronic'
  gem 'admin_view'
  gem 'better_errors'
end

group :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'shoulda'
  gem 'email_spec'
end

group :production, :development do
  gem 'thin'
end
