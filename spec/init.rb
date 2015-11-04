ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

require_relative '../app.rb'

require_all './'

include Rack::Test::Methods

def app
  Sinatra::Application
end
