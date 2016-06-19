require 'sinatra'
require 'omniauth-clever'

get '/' do
  <<-HTML
  HTML
end

post '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  # do whatever you want with the information!
end
