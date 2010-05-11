set :root, File.dirname(__FILE__)

get '/' do
  haml :index
end

require 'sass'
get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end
