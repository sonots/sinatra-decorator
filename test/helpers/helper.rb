ENV['RACK_ENV'] = 'test'
APP_ROOT = File.dirname(__FILE__)

$: << File.expand_path(File.join(File.dirname(__FILE__), '..', '..','lib'))
require 'rack/test'
require File.expand_path("#{File.dirname(__FILE__)}/mini_shoulda")
require 'sinatra-decorator'
require 'turn'

class MiniTest::Spec
  include Rack::Test::Methods
end

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end
