require './models/item'
require 'sinatra'

run Sinatra::Application

get '/' do
  erb :index
end

get '/items' do
  erb :items
end
