
require './models/item'

require 'sinatra'
require './models/item_list'

run Sinatra::Application

get '/' do
  erb :index
end

get '/items' do
  @search = params[:filter]
  erb :items
end
