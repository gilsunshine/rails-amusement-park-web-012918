class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:password] || params[:password] != ""
      @user = User.find_by(name: params[:name])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    if params
      session.delete(:user_id)
      redirect_to '/signin'
    else
      redirect_to '/signin'
    end
  end

end
