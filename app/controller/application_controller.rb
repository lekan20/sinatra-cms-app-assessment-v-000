class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "collection_security"
  end

  get '/' do
    session[:greeting] = "Hello World"
    "Hello World"
  end

  get '/remember' do
    session[:greeting]
  end

end
