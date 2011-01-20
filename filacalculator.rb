require 'sinatra'
require 'haml'
require 'sass'

set :views, File.dirname(__FILE__) + '/app/views'
set :public, File.dirname(__FILE__) + '/public'

get '/' do
  haml :index
end

get '/stylesheets/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end