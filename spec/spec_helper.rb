$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dow'

RSpec.configure do |config|
  config.formatter = :progress
  config.color     = true
  config.filter_run_excluding :artifact unless ENV['TEST_ARTIFACT']
end
