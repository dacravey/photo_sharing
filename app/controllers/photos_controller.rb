class PhotosController < ApplicationController
  def create
    @photo = current_user.photos.create( photo_params )
    redirect_to "/"
  end

  def new
    @photo = Photo.new
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def photo_params
    params.require(:photo).permit(:photo, :name, :caption)
  end
end
