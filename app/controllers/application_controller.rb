# frozen_string_literal: true

# Main Class
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path, notice: 'Please login' unless current_user
  end

  def deny_access_to_authorized
    redirect_to input_url if current_user
  end
end
