require './app'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :clever, ENV['CLEVER_CLIENT_ID'], ENV['CLEVER_CLIENT_SECRET'],
    :setup => lambda { |env|
    params = Rack::Utils.parse_query(env['QUERY_STRING'])
    env['omniauth.strategy'].options[:client_options][:district_id] = params['district_id']
  }
end

run Sinatra::Application
