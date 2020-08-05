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
          flash[:errors] = user.errors.full_messages
          render :new
        end
      end

      def edit 
       
        @user = User.find(params[:id])
       # need to handle protections here 
      end 

      def update
      
        @user.update(user_params)
          flash[:success] = "Profile updated"
          if @user.save
            redirect_to profile_path
          else 
            render :edit
          end 
       # need to handle protections here 
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
