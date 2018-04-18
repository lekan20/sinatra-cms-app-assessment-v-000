class UsersController < ApplicationController

  get '/signup' do #sign up the user if the user isn't logged in
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/shoes'
    end
  end

end
