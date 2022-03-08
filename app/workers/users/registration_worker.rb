# frozen_string_literal: true

module Users
  class RegistrationWorker
    include Sidekiq::Worker

    def perform(user_id)
      user = User.find_by(id: user_id)
      return if user.nil? || user.confirmed_by_email?

      UserMailer.with(user: user).reminder.deliver_now
    end
  end
end
