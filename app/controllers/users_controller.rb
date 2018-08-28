class UsersController < ApplicationController
  before_action :require_logged_in, only:[:inex]
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to controller:'users', action:'new' unless @user.authenticate(params[:password])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
