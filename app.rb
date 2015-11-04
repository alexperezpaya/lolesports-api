require 'bundler'
require 'require_all'
require 'sinatra'

require 'thin'
require 'rest-client'

if development?
  require 'sinatra/reloader'
end

require_all 'app'
