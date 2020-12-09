class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id]) # get room where we want to photos

    if params[:photos]
      params[:photos].each do |img| # get all images passed
        @room.photos.create(image: img) # create photo and pass image
      end

      @photos = @room.photos # get all photos from room to display
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to request.referrer
    end
  end
end
