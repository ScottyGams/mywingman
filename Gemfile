source 'https://rubygems.org'

gem 'rails', '3.2.18'
gem "nifty-generators", :group => :development

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


#authorization & authentication
gem 'devise'
gem 'cancan', '~> 1.6.10'
gem 'omniauth'
gem 'omniauth-facebook'

#APIs to pull from
gem 'geocoder'
gem 'foursquare2' #for location meetups
gem 'koala', "~> 1.10.0rc" #for facebook graph

#design choices
gem 'skeleton-rails'
gem 'haml-rails'
#may use create js for easy JS implimentation

#various other gems (with justification)
gem 'high_voltage' #about me page etc etc
gem 'carrierwave', '~> 0.9.0' #uploading files, if I decide
gem "fog", "~> 1.3.1" #for if images are uploaded to AWS
gem 'make_flaggable', :git => 'git://github.com/ScottyGams/make_flaggable.git' #reporting users
gem 'acts-as-taggable-on' #used for matching interests


group :development, :test do
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'sqlite3' #database
end

group :production do
  gem 'pg' #database
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
