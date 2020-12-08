class BagsController < ApplicationController

  # GET: /bags
  get "/bags" do
    erb :"/bags/index.html"
  end

  # GET: /bags/new create a new bag
  get "/bags/new" do
    erb :"/bags/new"
  end

  # POST: /bags
  post "/bags" do
    redirect "/bags"
  end

  # GET: /bags/5
  get "/bags/:id" do
    erb :"/bags/show.html"
  end

  # GET: /bags/5/edit
  get "/bags/:id/edit" do
    erb :"/bags/edit.html"
  end

  # PATCH: /bags/5
  patch "/bags/:id" do
    redirect "/bags/:id"
  end

  # DELETE: /bags/5/delete
  delete "/bags/:id/delete" do
    redirect "/bags"
  end
end
