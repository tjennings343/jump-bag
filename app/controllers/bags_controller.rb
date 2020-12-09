class BagsController < ApplicationController

  get "/bags" do
    erb :"/bags/index.html"
  end


  get "/bags/new" do
    erb :"/bags/new"
  end


  post "/bags" do
    if !logged_in?
      redirect "/"
    end
    if params[:content] != ""
      @bag = Bag.create(:bag_name => params[:bag_name], :user_id => current_user.id)
      redirect "/bags/#{@bag.id}"
    else
      redirect "/bags/new"
    end
  end


  get "/bags/:id" do
    @bag = Bag.find(params[:id])
    erb :"/bags/show"
   end


   get "/bags/:id/edit_name" do
    @bag = Bag.find(params[:id])
    if logged_in?
      if @bag.user == current_user
        erb :"/bags/edit_name"
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
        @bag.update(bag_name: params[:bag_name])
        redirect "/bags/#{@bag.id}"
      else
        redirect "users/#{current_user.id}"
      end 
    else
      redirect "/"
    end
    
  end


   # get "/bags/:id/add_item" do
  #   erb :"/bags/add_items"
  # end

  # # DELETE: /bags/5/delete
  # delete "/bags/:id/delete" do
  #   redirect "/bags"
  # end
end
