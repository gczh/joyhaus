source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.0'
gem 'pg'
gem 'thin'

# temporary
gem 'turbolinks'

# Authorization and Authentication
gem 'sorcery'
gem 'role_model'

#Assets & Templates
gem 'sass-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'font-awesome-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 1.2'
gem 'rails_utils'

#Utility
gem 'friendly_id', '~> 5.0.0'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-rspec', '~> 4.2.8', require: false
  gem 'quiet_assets'

  gem 'guard'
  gem 'guard-livereload', require: false

  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'rb-readline', require: false

  gem "letter_opener"
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0.0'
end

group :production do
  gem 'rails_12factor'
end