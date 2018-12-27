class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

     # Confirms an admin user.
     def admin_user
     if current_user.nil?
       redirect_to login_url
     elsif !(current_user.try(:admin?))
       redirect_to root_url
     end
   end
end
