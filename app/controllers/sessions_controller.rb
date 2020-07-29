class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
       redirect_to '/profile'
    else
       redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end 


  def login
  end

  def profile
  end
end
