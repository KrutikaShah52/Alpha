class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :show]  
before_action :require_same_user, only: [:edit, :update]

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
       
    end

    def update
        if @user.update(user_params)
            redirect_to alpha_scaffolds_path
        else
            render 'edit'
        end
    end
    
    def show
        # @user = User.find(params[:id])  #grep single user articles
        @user_articles = @user.alpha_scaffolds.paginate(page: params[:page], per_page: 3)
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
            flash[:danger] = "You can only edit your own account"
            redirect_to root_path
        end
    end

end
