# frozen_string_literal: true

# Main Class
class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new; end

  def create
    user = User.find_by_login(params[:login])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:alert] = 'Неверные логин или(и) пароль'
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
