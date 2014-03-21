
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

post '/items/:id' do
  @id = params[:id]
  @name = params[:name]
  erb :show
end

get '/items/:id/edit' do
  @id = params[:id]
  erb :edit_items
end

get '/new' do
  erb :add_new_item
end