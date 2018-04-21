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
    if !params[:brand].empty? && !params[:name].empty?
      @shoe = Shoe.create(:brand => params[:brand], :name => params[:name], :user_id => session[:user_id])
      flash[:message] = "Successfully created shoe!"
      redirect "/shoes/#{@shoe.id}"
    else
      flash[:message] = "Try again please."
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

  get '/shoes/:id/edit' do
    #UPDATE: edit shoes brand and name
    @shoe = Shoe.find_by_id(params[:id])
    if session[:user_id] && @shoe.user_id == session[:user_id]
      erb :'/shoes/edit_shoe'
    else
      redirect '/login'
    end
  end

  patch '/shoes/:id/edit' do
    #UPDATE: update tweet instance
    if !params[:brand].empty? || !params[:name].empty?
      @shoe = Shoe.find_by_id(params[:id])
      @shoe.brand = (params[:brand])
      @shoe.name = (params[:name])
      @shoe.save
      flash[:message] = "Successfully edited your shoe!"
      redirect "/shoes/#{@shoe.id}"
    else
      flash[:message] = "Please try again."
      redirect "/shoes/#{@shoe.id}/edit"
    end
  end

  delete '/shoes/:id/delete' do
    #DELETE: delete an instance of shoe
    #Checks that the creator of the shoe is deleting it
    @shoe = Shoe.find_by_id(params[:id])
    if session[:user_id] && @shoe.user_id == session[:user_id]
      @shoe.delete
      redirect '/shoes'
    elsif !logged_in?
      redirect '/login'
    else
      redirect '/shoes'
    end
  end


end
