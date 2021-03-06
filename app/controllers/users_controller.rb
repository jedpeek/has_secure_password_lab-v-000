class UsersController < ApplicationController
  before_action :require_logged_in, only:'index'
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to controller:'users', action:'new' unless @user.authenticate(params[:password])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
