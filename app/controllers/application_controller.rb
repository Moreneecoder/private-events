class ApplicationController < ActionController::Base
    def user_logged_in?
        !!session[:user_id]
    end

    def authenticate_user
        if !user_logged_in?
          flash[:alert] = 'You must sign in to continue'
          redirect_to new_user_path
        end
    end
end
