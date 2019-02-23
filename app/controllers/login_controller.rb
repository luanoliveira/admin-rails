class LoginController < ApplicationController
    def new
    end

    def create
        email = params[:login][:email]
        password = params[:login][:password]

        user = User.find_by(email: email)

        if user && user.authenticate(password)
            # ok
            auth user.id

            # user logged url
            redirect_to login_path
        else
            # error
            add_message(:danger, "Erro de login")
            redirect_to login_path
        end
    end

    def logout
        user_logout
        redirect_to login_path
    end
end