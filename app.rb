require 'sinatra'
require 'omniauth-clever'

get '/' do
  <<-HTML
  HTML
end

get '/success' do
  'success'
end

post '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  session[:uid] = env['omniauth.auth']['uid']
  # this is the main endpoint to your application
  # redirect to('/')
  'hello'
  # do whatever you want with the information!
end
