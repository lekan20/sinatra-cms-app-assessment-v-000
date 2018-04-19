class ShoesController < ApplicationController

  get '/shoes' do
    #Shows all shoes
    if logged_in?
      @shoes = Shoe.all
      erb :"/shoes/shoes"
    else
      redirect '/login'
    end
  end

  get '/shoes/new' do
    #CREATE: creates new shoe
    if logged_in?
      erb :'/shoes/create_shoe'
    else
      redirect '/login'
    end
  end


end
