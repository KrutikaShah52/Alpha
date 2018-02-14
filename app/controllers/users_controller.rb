class UsersController < ApplicationController

    def index
        @users = User.paginate(page: params[:page], per_page: 3)
    end

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

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to alpha_scaffolds_path
        else
            render 'edit'
        end
    end
    
    def show
        @user = User.find(params[:id])  #grep single user articles
        @user_articles = @user.alpha_scaffolds.paginate(page: params[:page], per_page: 3)
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
