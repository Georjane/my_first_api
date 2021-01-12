class HomeController < ApplicationController
  require 'flickr'
  
  def index
    if params[:user_id]
      flickr = Flickr.new(ENV['api_key'], ENV['api_secret'])

      @user_id = params[:user_id]
      @profile = flickr.profile.getProfile(:user_id => @user_id)
      @photos = flickr.people.getPhotos(:user_id => @user_id)
      flash.now[:notice] = "User search was successful!"
    end

    rescue Flickr::FailedResponse
    flash.now[:alert] = 'Unable to find User ID!'
  end
end
