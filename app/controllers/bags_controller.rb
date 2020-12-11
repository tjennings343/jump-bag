class BagsController < ApplicationController

  
  get "/bags" do
    @bags = Bag.all
    erb :"/bags/index"
  end


  get "/bags/new" do
    erb :"/bags/new"
  end


  post "/bags" do
    if !logged_in?
      redirect "/"
    end
    @bag = Bag.create(:bag_name => params[:bag_name], :bag_contents => params[:bag_contents], :user_id => current_user.id)
    if @bag.save
      redirect "/bags/#{@bag.id}"
    else
      redirect "/bags/new"
    end
  end


  get "/bags/:id" do
    @bag = Bag.find(params[:id])
    erb :"/bags/show"
   end


   get "/bags/:id/edit" do
    @bag = Bag.find(params[:id])
    if logged_in?
      if @bag.user == current_user
        erb :"/bags/edit"
        else
        redirect "users/#{current_user.id}"
      end
    else
      redirect "/"
    end
  end

  
  patch "/bags/:id" do
    @bag = Bag.find(params[:id])
    if logged_in?
      if @bag.user == current_user
        @bag.update(bag_name: params[:bag_name], bag_contents: params[:bag_contents])
        redirect "/bags/#{@bag.id}"
      else
        redirect "users/#{current_user.id}"
      end 
    else
      redirect "/"
    end
  end


  delete "/bags/:id" do
    bag = Bag.find(params[:id])
    if bag.user == current_user
      bag.delete
    end
    redirect "/bags"
  end

  get "/my_bags" do
    @bag = current_user.bags
    erb :"/bags/my_bags"
    
  end
  
  
end
