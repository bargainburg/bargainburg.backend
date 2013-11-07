source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '~> 4.0.0'
gem 'rails', github: 'rails/rails', branch: '4-0-stable'

gem 'rails-api'
gem 'paperclip', "~> 3.0"
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'cancan'
gem "rolify"
gem "squeel", "~> 1.1.1"

# Deploy with Capistrano
gem 'capistrano'
gem "capistrano-bundler"
gem "capistrano-rails"

gem 'authlogic', :github => 'tylerkahn/authlogic'
# needed to work with rails-api
# see: http://git.io/3h4-Jg


# Use sqlite3 as the database for Active Record
if RUBY_PLATFORM =~ /win32/
  gem 'sqlite3', :platform => [:mswin, :mingw]
else
  gem 'sqlite3'
end

group :development do
  gem 'populator'
  gem 'faker'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard'
  gem 'guard-rspec'
  gem 'fuubar', "~> 1.2.1"
end

group :test do
  gem 'factory_girl_rails'
  gem 'ruby_gntp'
  gem 'simplecov', :require => false
end

group :production do
    gem 'pg', "~> 0.17.0"
    gem 'passenger', "~> 4.0.20"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'


# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
