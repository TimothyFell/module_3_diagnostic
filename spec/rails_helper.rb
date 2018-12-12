require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
# require 'vcr'
require 'webmock/rspec'
require 'simplecov'

# VCR.configure do |config|
#   config.ignore_localhost = true
#   config.cassette_library_dir = 'spec/cassettes'
#   config.hook_into :webmock
#   config.configure_rspec_metadata!
#   config.filter_sensitive_data("<API_KEY>") { ENV['API_KEY'] }
# end

ActiveRecord::Migration.maintain_test_schema!

SimpleCov.start "rails"

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
