# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.3.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'
# providing configurable, manageable, and safe stateful sessions based on JSON Web Tokens.
gem 'jwt_sessions'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails'
  # factory_bot_rails is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies
  gem 'factory_bot_rails'
  # This gem is a port of Perl's Data::Faker library that generates fake data.
  gem 'ffaker'
  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities
  gem 'pry'
  # rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in alternative to its default testing framework, Minitest.
  gem 'rspec-rails'

  # Security tools
  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
  gem 'brakeman'
  # Patch-level verification for bundler.
  gem 'bundler-audit'
  # RubyAudit checks your current version of Ruby and RubyGems against known security vulnerabilities (CVEs)
  gem 'ruby_audit'

  # Linting
  # RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter.
  gem 'rubocop'
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem 'rubocop-rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'letter_opener'
end

group :test do
  # RSpec 2 & 3 results that your CI can read.
  gem 'rspec_junit_formatter'
end
