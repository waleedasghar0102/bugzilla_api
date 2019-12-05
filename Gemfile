source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'devise_token_auth'
gem 'devise'
gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'pg'
gem 'rack-cors'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'ed25519'
gem 'bcrypt_pbkdf'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails' #Should already be in your Gemfile
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
