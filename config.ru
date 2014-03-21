
require './models/item'
require './models/item_list'
require 'sinatra'


run Sinatra::Application

get '/' do
  erb :index
end

get '/items' do
  @search = params[:filter]
  erb :items
end

post '/items' do
  @name = params[:name]
  erb :items
end

get '/items/:id' do
  @id = params[:id]
  erb :show
end

get '/new' do
  erb :add_new_item
end