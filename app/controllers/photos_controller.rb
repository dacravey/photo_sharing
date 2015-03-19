class PhotosController < ApplicationController
  def create
    @photo = Photo.create( photo_params )
  end

  def new
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def photo_params
    params.require(:photo).permit(:photo, :name, :caption)
  end
end
