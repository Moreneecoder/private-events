class UsersController < ApplicationController
    before_action :user_logged_in?, only: [:show]
    before_action :set_user, only: [:show]
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = 'You registered successfully'
        redirect_to @user
      else
        render :new
      end
    end

    def show
      
    end

    private

    def user_params
      params.require(:user).permit(:name)
    end

    def set_user
      @user = User.find(session[:user_id])
    end
end
