class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    redirect_to controller:'users', action:'new' unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
