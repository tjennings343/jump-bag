class UsersController < ApplicationController

    get "/users/login" do
        erb :"/users/login"
    end

    post "/login" do
        
        @user = User.find_by(username: params[:username])
        
        if @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect "users/#{@user.id}"
        else
            
        end
        
    end

    get "/users/:id" do
        "this is the user page"
    end

    get "/users/signup" do
        erb :"/users/signup"
    end

    post "/users/signup" do 
        @user = User.create(:name => params[:name], :username => params[:username], :password => params[:password])        
    end


end