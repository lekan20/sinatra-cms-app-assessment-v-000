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
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/shoes'
    end
  end

  get '/login' do #if a user isn't logged in, take them to the login page.
    if !logged_in?
      erb :'users/login'
    else
      redirect '/shoes'
    end
  end

  post '/login' do
    #find the user, make sure the user and thier password matches, save the user id to the session
    #if not, bring them to the login page
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/shoes'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    #logs out user if they're already logged in
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
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

  get '/users/:slug' do
    #shows all of a user's shoes
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

end
