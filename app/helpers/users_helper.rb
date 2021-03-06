module UsersHelper

    def auth(user_id)
        session[:user_id] = user_id
    end

    def current_user
        if session[:user_id]
            user = User.find(session[:user_id])

            if user
                @user = user
            end
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def user_logout
        session.delete(:user_id)
    end

end