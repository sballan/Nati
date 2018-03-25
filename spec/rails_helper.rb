# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# These are provided by devise.  We can mimic logging in.
include Warden::Test::Helpers
Warden.test_mode!

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # So we can use url helpers in our tests
  config.include Rails.application.routes.url_helpers	

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false

  config.before(:suite) 					  { DatabaseCleaner.clean_with(:truncation) }
  config.before(:each)  					  { DatabaseCleaner.strategy = :transaction }
  config.before(:each, :js => true) { DatabaseCleaner.strategy = :truncation  }
  config.before(:each) 							{ DatabaseCleaner.start }
  config.after(:each)								{ DatabaseCleaner.clean}

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
