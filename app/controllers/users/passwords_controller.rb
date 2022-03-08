module Users
  class PasswordsController < ApplicationController
    def new; end

    def create
      user = User.find_by_email(params[:email])
      if user.present?
        UserMailer.with(user: user).reset_password_instructions.deliver_now
        redirect_to login_path, notice: 'Reset password instructions delivered'
      else
        redirect_to forgot_path
      end
    end

    def edit
      @user = User.find_signed!(params[:token], purpose: 'reset_password')
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to forgot_path, alert: 'Reset password instructions invalid'
    end

    def update
      @user = User.find_signed!(params[:token], purpose: 'reset_password')

      if @user.update(password_params)
        UserMailer.reset_password_confirmation(@user).deliver_now
        session[:user_id] = @user.id
        redirect_to login_path, notice: 'Password successfully reset!'
      else
        render :edit
      end
    end

    private

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  end
end
