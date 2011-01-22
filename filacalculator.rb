require 'sinatra'
require 'haml'
require 'sass'
require 'json'
require File.dirname(__FILE__) + '/app/models/calculator'

set :views, File.dirname(__FILE__) + '/app/views'
set :public, File.dirname(__FILE__) + '/public'

before do
  @calculator = Calculator.new
  @banheiro = @calculator.select('banheiro')
  @refeitorio = @calculator.select('refeitorio')
  @onibus = @calculator.select('onibus')
  @bebedouro = @calculator.select('bebedouro') 
  @entrada_principal = @calculator.select('entrada_principal')
  @entrada_camping = @calculator.select('entrada_camping')
  @date = view_date
end

get '/' do
  haml :index
end

get '/stylesheets/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end

get '/calculator.json' do
  content_type :json

  {
    :date => @date,
    :time => Time.now.strftime("%H:%M"), 
    :status => {
      :"Banheiro" => @banheiro['banheiro'],
      :"Refeitório" => @refeitorio['refeitorio'],
      :"Ônibus até Jabaquara" => @onibus['onibus'],
      :"Bebedouro" => @bebedouro['bebedouro'],
      :"Stands » Arena" => @entrada_principal['entrada_principal'],
      :"Camping » Arena" => @entrada_camping['entrada_camping']
    }
  }.to_json
end

private

def view_date
  weeks = %w(Segunda-Feira Terça-Feira Quarta-Feira Quinta-Feira Sexta-Feira Sábado Domingo)
  months = %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro)

  date = Time.now
  return "#{weeks[date.wday - 1]}, #{date.day} de #{months[date.month - 1]} de #{date.year}"
end
