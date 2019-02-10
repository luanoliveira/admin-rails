class UsersController < ApplicationController

    def signin
        @user = User.new

        if request.post?
            user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
            @user.attributes = user_params
            if @user.save
                # Handle a successful save.
            end
        end
    end

    def create
        
        
    end

end