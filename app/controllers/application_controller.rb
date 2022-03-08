# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_cache_headers

  private

  # Helper method for current user
  def current_user
    user = User.find_by_id(session[:user_id]) if session[:user_id]
    reset_session unless user&.confirmed_by_email?
    user
  end

  # Deny access unless user is logged in
  def authenticate_user
    redirect_to login_path unless current_user
  end

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Mon, 01 Jan 1990 00:00:00 GMT'
  end
end
