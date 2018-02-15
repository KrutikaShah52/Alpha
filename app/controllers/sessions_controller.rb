class SessionsController < ApplicationController

    def new

    end

    def create
        # render 'new'
        # debugger
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully loged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "There is somthing wrong with your email and password"
            render 'new'
        end 
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully loged out.."
        redirect_to root_path
    end

end
