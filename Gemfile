source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3' # important!
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'thin'
gem 'haml-rails'
gem 'jquery-ui-rails'
gem 'jquery-rails'

# JSON SUPPORT
gem 'jbuilder', '~> 2.0'
gem 'active_model_serializers'

# DOCUMENTATION
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'faker'
gem 'yard'
# AUTHENTICATION
gem 'devise'


# group :development do
#   gem 'capistrano', '~> 3.2.0'
#   gem 'capistrano-rails', '~> 1.1'
#   gem 'capistrano-bundler', '~> 1.1.3'
#   gem 'capistrano-rvm'
#   gem 'capistrano-bower'
# end


group :development do
  gem 'railroady'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'simplecov', require: false
  gem 'simplecov-rcov'
end

group :production do
  gem 'unicorn'
  # HEROKU
  gem 'rails_12factor', '0.0.2'
end

