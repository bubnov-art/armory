source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'devise'
gem 'omniauth-bnet'
# gem 'redis', '~> 3.0'

# gem 'bcrypt', '~> 3.1.7'

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'selenium-webdriver'
end

group :test do 
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', require: false
  gem 'rails-controller-testing'

end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
