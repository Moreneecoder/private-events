class ApplicationController < ActionController::Base
    def user_logged_in?
        !!session[:user_id]
    end
end
