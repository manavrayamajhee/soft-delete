# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'factory_bot_rails'
require 'faker'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

