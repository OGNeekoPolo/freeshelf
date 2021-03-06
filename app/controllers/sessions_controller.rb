class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.id
      redirect_to books_path
    end
  end

  def destroy
    reset_session
    redirect_to users_index_path
  end
end
