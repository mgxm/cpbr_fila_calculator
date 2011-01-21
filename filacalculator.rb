require 'sinatra'
require 'haml'
require 'sass'
require 'json'
require File.dirname(__FILE__) + '/app/models/calculator'

set :views, File.dirname(__FILE__) + '/app/views'
set :public, File.dirname(__FILE__) + '/public'

get '/' do
  @calculator = Calculator.new
  @banheiro = @calculator.select('banheiro')
  @refeitorio = @calculator.select('refeitorio')
  @onibus = @calculator.select('onibus')
  @bebedouro = @calculator.select('bebedouro') 
  @entrada_principal = @calculator.select('entrada_principal')
  @entrada_camping = @calculator.select('entrada_camping')
  haml :index
end

get '/stylesheets/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end

get '/calculator.json' do
  content_type :json

  @calculator = Calculator.new
  @banheiro = @calculator.select('banheiro')
  @refeitorio = @calculator.select('refeitorio')
  @onibus = @calculator.select('onibus')
  @bebedouro = @calculator.select('bebedouro') 
  @entrada_principal = @calculator.select('entrada_principal')
  @entrada_camping = @calculator.select('entrada_camping')

  {
    :hour => Time.now.strftime("%H:%M"), 
    :banheiro => @banheiro['banheiro'],
    :refeitorio => @refeitorio['refeitorio'],
    :onibus => @onibus['onibus'],
    :bebedouro => @bebedouro['bebedouro'],
    :entrada_principal => @entrada_principal['entrada_principal'],
    :entrada_camping => @entrada_camping['entrada_camping']
  }.to_json
end
