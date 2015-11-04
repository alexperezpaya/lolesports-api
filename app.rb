require 'bundler'
require 'sinatra'
require 'require_all'

Bundler.require

require 'uri'
require 'CGI'
require 'time'

if development?
  require 'sinatra/reloader'
end

require_all 'app'
