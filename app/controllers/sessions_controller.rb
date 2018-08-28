class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    redirect_to(controller: 'users', action: 'new') unless user
    session[:user_id] = user.id
    return redirect_to controller:'users', action:'index'
  end
end
