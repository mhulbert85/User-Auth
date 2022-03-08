# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome
    @purpose = 'welcome'
    @token = params[:user].signed_id(purpose: @purpose, expires_in: 23.hours)
    mail(to: params[:user].email, subject: 'Confirm your email address')
  end

  def reminder
    @purpose = 'reminder'
    @token = params[:user].signed_id(purpose: @purpose, expires_in: 1.hour)
    mail(to: params[:user].email, subject: 'Reminder: Confirm your email address')
  end

  def reset_password_instructions
    @token = params[:user].signed_id(purpose: 'reset_password', expires_in: 30.minutes)
    mail(to: params[:user].email, subject: 'Your password has been reset')
  end

  def reset_password_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Your password has been updated')
  end
end
