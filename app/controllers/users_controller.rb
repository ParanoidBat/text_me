class UsersController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      flash[:success] = "Welcome to No-Homo-Chat #{@user.username}"

      redirect_to root_path

    else
        render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
