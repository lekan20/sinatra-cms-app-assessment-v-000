class ShoesController < ApplicationController

  get '/shoes' do
    #Shows all shoes
    if logged_in?
      @shoes = Shoe.all
      erb :'/shoes/shoes'
    else
      redirect '/login'
    end
  end


end
