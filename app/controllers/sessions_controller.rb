class SessionsController < ApplicationController

  def create
    session[:name] = User.find(name: params[:name])
end
