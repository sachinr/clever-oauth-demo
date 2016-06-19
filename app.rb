require 'sinatra'
require 'omniauth-clever'

get '/' do
  <<-HTML
   Clever OAuth Demo
  HTML
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  session[:uid] = env['omniauth.auth']['uid']
  # this is the main endpoint to your application
  redirect to('/')
  # do whatever you want with the information!
end
