class SessionsController < ApplicationController
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

end
