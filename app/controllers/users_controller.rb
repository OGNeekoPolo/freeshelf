class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_index_path
    else
      render 'new'
    end
  end

  def update

  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email, :password_confirmation)
    end
end
