#require 'rubygems'
#require 'haml'
require 'vendor/gems/environment.rb'
require 'sinatra'

get '/' do
  haml :index
end
