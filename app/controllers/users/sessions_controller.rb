module Users
  class SessionsController < ApplicationController
    def new; end

    def create
      user = User.find_by_email(params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(session[:user_id])
      else
        redirect_to login_path, alert: 'Invalid email or password'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to login_path
    end
  end
end
