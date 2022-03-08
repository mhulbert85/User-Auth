module Users
  class OmniauthController < ApplicationController
    def callback
      user = User.from_omniauth(auth)
      if user.nil?
        redirect_to register_path, alert: "#{auth[:provider]} email is missing"
      elsif user.save || user.confirmed_by_email?
        session[:user_id] = user.id
        redirect_to user_path(session[:user_id])
      end
    end

    def failure
      flash[:alert] = 'Something is wrong'
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end
end
