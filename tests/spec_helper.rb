# frozen_string_literal: true

require 'rack/test'
require 'json'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.pattern = 'tests/**/*_spec.rb'
  config.include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end
