source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 7.0.1'

gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# for background jobs/workers
gem 'redis', '~> 4.0'
gem 'sidekiq', '>= 6.4.1'

# for authentication
gem 'bcrypt', '~> 3.1.7'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin-oauth2'
gem 'omniauth-rails_csrf_protection'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'colorize'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'letter_opener'
end

group :development do
  gem 'web-console'
end
