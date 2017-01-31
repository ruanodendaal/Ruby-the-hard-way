require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  return 'Hello world'
end

get '/hello/:name' do
  greeting = params[:greeting] || "Hi there"
  erb :index, :locals => {'greeting' => greeting}
end

get '/greet/:name' do
  "Hello #{params['name']}!"
end
