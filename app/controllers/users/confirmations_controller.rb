module Users
  class ConfirmationsController < ApplicationController
    def email
      user = User.find_signed!(params[:token], purpose: params[:purpose])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to root_path, notice: 'Confirmation link is invalid'
    else
      user.update_columns(confirmed_by_email: true, roles: 1)
      session[:user_id] = user.id
      redirect_to user_path(session[:user_id])
    end
  end
end
