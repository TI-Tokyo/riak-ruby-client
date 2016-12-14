require 'bundler/setup'

# ruby 1.9 and jruby without debug do not support single-cov
if RUBY_VERSION >= "2." && (RUBY_ENGINE != 'jruby' || ENV['JRUBY_OPTS'].to_s.include?('--debug'))
  require 'single_cov'
  SingleCov.setup :rspec
end

require 'riak'
require 'stringio'
require 'pp'
require 'instrumentable'

# Only the tests should really get away with this.
Riak.disable_list_keys_warnings = true

%w[integration_setup
   version_filter
   wait_until
   search_corpus_setup
   unified_backend_examples
   test_client
   search_config
   crdt_search_config
   crdt_search_fixtures
].each do |file|
  require_relative File.join("support", file)
end

RSpec.configure do |config|
  #config.debug = true
  config.mock_with :rspec

  config.before(:each) do
    Riak::RObject.on_conflict_hooks.clear
  end

  if TestClient.test_client_configuration[:authentication]
    config.filter_run_excluding no_security: true
  else
    config.filter_run_excluding yes_security: true
  end

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  if defined?(::Java)
    config.seed = Time.now.utc
  else
    config.order = :random
  end

  config.raise_errors_for_deprecations!
end
