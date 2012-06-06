source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'haml', '3.1.4'
gem 'thin'
gem 'omniauth'
gem 'omniauth-github', :git => 'git://github.com/intridea/omniauth-github.git'
gem 'deep_merge'

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'
  gem 'compass-rails'
end

gem 'jquery-rails'

# To use debugger
group :development do
  gem 'quiet_assets'
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test, :development do
  gem 'rspec-rails'
end
