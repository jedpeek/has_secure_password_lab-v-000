class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:name])
    user = user.try(:authenticate, params[:user][:password])
    redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = @user.id
  end
end
