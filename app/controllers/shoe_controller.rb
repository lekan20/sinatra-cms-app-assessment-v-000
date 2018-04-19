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

  post '/shoes' do
    #CREATE: creates new instance of shoes (creates a new shoe)
    if !params[:brand].empty? || !params[:name].empty?
      @shoe = Shoe.create(:brand => params[:brand], :name => params[:name], :user_id => params[:user_id])
      redirect '/shoes/#{@shoe.id}'
    else
      redirect '/shoes/new'
    end
  end

  get '/shoes/:id' do
    #READ: shows the specific shoe
    if logged_in?
      @shoe = Shoe.find_by_id(params[:id])
      erb :'/shoes/show_shoe'
    else
      redirect '/login'
    end
  end


end
