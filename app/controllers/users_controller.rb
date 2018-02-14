class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # flahs[:success] = "Welcome to the alpha blog #{@user.username}"
            redirect_to alpha_scaffolds_path
        else
            render 'new'   #and show the error messages from users.new.html.ebr file
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end