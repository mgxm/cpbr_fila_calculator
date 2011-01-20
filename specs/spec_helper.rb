require 'sinatra'
require 'rack/test' 
require File.dirname(__FILE__) + '/../filacalculator'
require File.dirname(__FILE__) + '/../app/models/calculator'

RSpec.configure do |config| 
  config.include Rack::Test::Methods
end
