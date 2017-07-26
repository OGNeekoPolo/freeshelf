class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:id] && User.find_by(id: session[:id])
  end

  def authenticate_user!
   if user_signed_in? != true
     redirect_to users_index_path
   end
  end

  def user_signed_in?
   @current_user.present?
  end
end
