require 'sinatra'
require 'haml'

set :views, File.dirname(__FILE__) + "/app/views/"

get '/' do
  haml :index
end
