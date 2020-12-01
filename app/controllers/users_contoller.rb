class UsersController < ApplicationController

    get "/users/login" do
        erb :"/users/login"
    end

    post "/login" do
        
    end

    get "/users/signup" do
        erb :"/users/signup"
    end

    post "/users/signup" do 
        @user = User.create(:name => params[:name], :username => params[:username], :password => params[:password])
    end


end