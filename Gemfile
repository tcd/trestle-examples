source("https://rubygems.org")
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.4"

gem "rails", "~> 6.0.4", ">= 6.0.4.1" # Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'

gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password
# gem "image_processing", "~> 1.2" # Use Active Storage variant
gem "lograge", "~> 0.11.2" # Tame Rails' multi-line logging into a single line per request
gem "nilify_blanks", "~> 1.4" # Automatically convert blank values to nil (So we don"t junk up our DB)
gem "pg", ">= 0.18", "< 2.0" # Use postgresql as the database for Active Record
gem "puma", "~> 4.1" # Use Puma as the app server
gem "sass-rails", ">= 6" # Use SCSS for stylesheets
gem "trestle", "~> 0.9.5" # Admin dashboard

group :development, :test do
  gem "dotenv-rails", "~> 2.7" # Load .env files
  gem "pry", "~> 0.13.0" # Better rails console
end

group :development do
  gem "pry-rails" # Better rails console
end
