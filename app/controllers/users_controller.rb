class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user[:password] = user_params[:password]
        @user[:username] = user_params[:username]
        @user[:email] = user_params[:email]
        if @user.update(user_params)
            flash[:notice] = "Update Successful"
         else
            flash[:notice] = "Update Failed"
         end
        render :edit
    end

    def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(user_params)

        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email,:username,:password)
    end
end
