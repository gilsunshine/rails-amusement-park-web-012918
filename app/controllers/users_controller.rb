class UsersController < ApplicationController

    def index
      #root
    end

    def new
      @user = User.new
    end

    def create
      # binding.pry
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else
        render :new
      end
    end

    def show
      set_user
    end

    def edit
      set_user
    end

    def update
      set_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin, :password, :password_confirmation)
    end

end
