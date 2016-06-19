require 'sinatra'
require 'omniauth-clever'
require 'json'

get '/' do
  @user_id = nil
  if session[:auth]
    @user_id = session[:auth][:uid]
    @session_info = session[:auth][:extra][:raw_info].to_json
  end

  erb :index
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  session[:auth] = auth
  redirect to('/')
end

post '/sign_out' do
  session[:auth] = nil
  redirect to('/')
end
