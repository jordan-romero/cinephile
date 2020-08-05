class UsersController < ApplicationController
 

    def new 
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
          log_in(@user)
          redirect_to profile_path
        else
          @errors = @user.errors.full_messages 
          render :new
        end
      end

      def edit 
        if logged_in? 
          @user = current_user
        else 
          redirect_to login_path
        end 
  
      end 

      def update
        @user = current_user 
        if current_user == @user 
        @user.update(user_params)
          flash[:success] = "Profile updated"
          if @user.save
            redirect_to profile_path
          else 
            @errors = @user.errors.full_messages
            render :edit
          end 
        else 
          flash[:notice] = "Not Authorized!"
          redirect_to login_path
        end 
        
      end 


      def destroy
        session.delete :user_id
        redirect_to root_path
      end



     private 
     def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :avatar)
     end 

end
