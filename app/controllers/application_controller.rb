class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

    def current_user    
        User.find_by(id: session[:user_id])  
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def logged_in?
        !current_user.nil?  
    end

    def authenticate
        redirect_to login_path if !logged_in?
    end

    def authorized
        redirect_to root_path unless logged_in?
     end

    def owns_resource?(resource)
        resource.user == current_user
    end 

    def authorize(resource)
        redirect_to '/profile' if !owns_resource?(resource)
    end
end

