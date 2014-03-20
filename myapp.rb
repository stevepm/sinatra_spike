require 'sinatra'
require '/controllers/items_controller'

get '/' do
  erb :index
end

get '/items' do
  erb :items
end
