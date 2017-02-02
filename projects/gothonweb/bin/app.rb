require 'sinatra'
require 'haml'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  return 'Hello world'
end

get '/hello/' do
  erb :hello_form
end

post '/hello/' do
  greeting = params[:greeting] || "Hi there"
  name = params[:name] || "Nobody"

  erb :index, :locals => {'greeting' => greeting, 'name' => name}
end

get '/upload/' do
  haml :upload_form
end

# Post-request - receive & save the uploaded file
post '/upload/' do
  @filename = params['myfile'][:filename]
  file = params['myfile'][:tempfile]
  File.open("uploads/#{@filename}", "w") do |f|
    f.write(file.read)
  end
  erb :show_image
end
