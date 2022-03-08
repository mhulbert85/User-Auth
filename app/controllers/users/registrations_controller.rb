module Users
  class RegistrationsController < ApplicationController
    before_action :authenticate_user, only: %i[show destroy]

    def new
      @user = User.new
    end

    def create
      user = User.new user_params
      if user.save
        UserMailer.with(user: user).welcome.deliver_now
        redirect_to root_path, notice: 'Confirm your email to proceed'
      else
        redirect_to register_path
      end
    end

    def destroy
      current_user.destroy # TODO: only by params id not current user
      redirect_to register_path
    end

    private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
