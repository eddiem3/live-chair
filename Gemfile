source 'https://rubygems.org'
gem 'rails', '4.0.8'
gem 'pg'
gem 'monban'
gem 'monban-generators'
gem "paperclip", "~> 4.2"
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

group :doc do
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false #Rspec DSL Help
  gem 'rspec-rails'
  gem 'factory_girl_rails'			
  gem 'spork-rails'   #Autoload rails to speed up tests
  gem 'guard-spork'
  gem 'json_spec'  #Helpers for capybara json testing
end

group :production do
  gem 'rails_12factor'
  gem 'thin', '~> 1.6.2'
end

gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'rabl'

