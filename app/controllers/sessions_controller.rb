class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if !@user
      redirect_to '/signin'
    else
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/signin'
  end

end
