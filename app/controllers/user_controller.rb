class UsersController < ApplicationController

  get '/signup' do #sign up the user if the user isn't logged in
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/shoes'
    end
  end

  post '/signup' do #create a new user with inputs or send them back to signup page if any field is blank
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:email])
      session[:user_id] = @user.id
      redirect '/shoes'
    end
  end

end
