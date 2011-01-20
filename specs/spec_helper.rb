require 'sinatra'
require 'rack/test' 

def app
  @app ||= Sinatra::Application
end
