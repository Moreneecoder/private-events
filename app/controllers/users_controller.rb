class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show]
    before_action :current_user, only: [:show]
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

    def sign_in

    end

    def start_user_session
      if User.exists?(name: params[:name])
        @user = User.find_by(name: params['name'])
        session[:user_id] = @user.id
        flash[:notice] = 'You logged in successfully'
        redirect_to @user
      end
    end

    def end_user_session
        session[:user_id] = nil
        redirect_to users_sign_in_path
    end

    def show
      @user_events = @user.events
    end

    private

    def user_params
      params.require(:user).permit(:name)
    end

    def current_user
      @user = User.find(session[:user_id])
    end
end
