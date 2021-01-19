class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
    if session[:user_id]
      redirect_to root_path
    end
  end
  
  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      flash[:success] = "Logged In"
      redirect_to root_path

    else
      flash.now[:error] = "Invalid Credentials"
      render 'new'
    end

  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:success] = "Logged Out"
    end

    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      redirect_to root_path
    end
  end

end
