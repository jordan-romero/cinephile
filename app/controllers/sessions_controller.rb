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

  def fb_create
    @user = User.find_or_create_by(username: auth["info"]["name"], email: auth['info']['email'])	    
      if !@user.password	    
        @user.password = SecureRandom.hex	      
      end	  
    @user.save	   
    log_in(@user)  
    redirect_to profile_path
  end	  


  private
 
  def auth
    request.env['omniauth.auth']
  end
end
