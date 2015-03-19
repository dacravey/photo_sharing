class HomeController < ApplicationController
  def index
    @users = User.all
    @photos = Photo.all
  end
end
