$: << File.dirname(__FILE__)

begin
  require ::File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  require 'bundler'
  Bundler.setup
end
Bundler.require

require 'index'
run Sinatra::Application
