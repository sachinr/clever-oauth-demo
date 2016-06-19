require './app'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :clever, ENV['CLEVER_CLIENT_ID'], ENV['CLEVER_CLIENT_SECRET']
end

run Sinatra::Application
