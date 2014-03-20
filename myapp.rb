require 'sinatra'

get '/' do
  erb :index
end

get '/items' do
  erb :items
end
