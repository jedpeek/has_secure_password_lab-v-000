class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user

    return redirect_to controller:'users', action:'index'
  end
end
