class UsersController < ApplicationController

    get "/users/login" do
        erb :"/users/login"
    end

    post "/login" do
    @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
                redirect "users/#{@user.id}"
        else
                redirect "/users/signup"
        end   
    end

    get "/users/signup" do
        erb :"/users/signup"
    end


    post "/users" do
        @user = User.create(:name => params[:name], :username => params[:username], :password => params[:password])
        session[:id] = @user.id
        if @user.save
            redirect "/users/#{@user.id}"
        else
            erb :'users/signup'
        end
        

    end


    get "/users/:id" do
        @user = User.find_by(id: params[:id])
        @bags = @user.bags
        erb :"/users/homepage"    
    end

    get "/logout" do
        session.clear
        redirect "/users/login"
    end


end