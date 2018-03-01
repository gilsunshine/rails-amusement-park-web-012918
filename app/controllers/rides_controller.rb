class RidesController < ApplicationController
  helper RidesHelper
  def new

  end

  def create
    # binding.pry
    @user = User.find(current_user)
    @attraction = Attraction.find(params[:id])
    @ride = Ride.create(user: @user, attraction: @attraction)
    @ride.take_ride
    redirect_to user_path(@user)
  end

end
