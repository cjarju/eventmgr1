source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# rails '5.0.2'
gem 'rails', '~> 5.0.2'

# Use postgresql as the database for Active Record
# pg '0.20.0'
gem 'pg', '~> 0.18'

# Use Puma as the app server
# puma '3.8.2'
gem 'puma', '~> 3.0'

# Use SCSS for stylesheets
# sass-rails '5.0.6'
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
# uglifier '3.1.9'
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
# coffee-rails '4.2.1'
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# jquery-rails '4.3.1'
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# turbolinks '5.0.1'
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# jbuilder '2.6.3'
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
# bcrypt '3.1.11'
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # byebug '9.0.6'
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  # web-console '3.4.0'
  gem 'web-console', '>= 3.3.0'
  # listen '3.0.8'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # spring '2.0.1'
  gem 'spring'
  # spring-watcher-listen '2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# my additions 

# use chartkick for charting
# chartkick '1.2.5'
gem 'chartkick', '~> 1.2.4'

# use will_paginate for page pagination
# will_paginate '3.0.12'
gem 'will_paginate', '~> 3.0.5'

# use bootstrap pagination component with will_paginate gem
# will_paginate-bootstrap '1.0.1'
gem 'will_paginate-bootstrap', '~> 1.0.1'

# xlsx file builder
# axlsx '2.0.1'
gem 'axlsx', '~> 2.0.1'
# axlsx_rails '0.5.0'
gem "axlsx_rails", '~> 0.5.0'

# Previous versions of Rails required you to add a gem to your 
# project rails_12factor to enable static asset serving and 
# logging on Heroku. This gem is not needed in Rails 5.

#group :production do
  # To enable features such as static asset serving and logging 
  # on Heroku please add rails_12factor gem to your Gemfile.
  # rails_12factor '0.0.3'
#  gem 'rails_12factor'
#end