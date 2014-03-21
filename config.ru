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
  @id = params[:id]
  menu = ItemList.new
  menu.add_item(@name)

  redirect '/items'
end

get '/items/:id' do
  menu = ItemList.new
  if menu.show_item?(params[:id])
    erb :show, locals: {id: params[:id], menu: menu}
  else
    redirect '/items'
  end
end

post '/items/:id/delete' do
  menu = ItemList.new
  menu.delete_item(params[:id])
  redirect '/items'
end

post '/items/:id' do
  @id = params[:id]
  @new_name = params[:new_name]
  erb :show, locals: {id: params[:id], menu: ItemList.new}
end

get '/items/:id/edit' do
  @id = params[:id]
  erb :edit_items
end

get '/new' do
  erb :add_new_item
end

get '/error' do
  erb :not_found
end