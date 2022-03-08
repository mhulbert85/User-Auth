class User < ApplicationRecord
  # self.filter_attributes = [:email, :password_digest]
  has_secure_password

  # Associations
  # has_many :objects, dependent: :destroy

  # Validation
  validates :email, :id, uniqueness: true
  validates :email, :password, presence: true
  # validates_associated :objects

  # Encryption
  encrypts :email, deterministic: true

  # Roles
  enum :roles, %i[new_user registered_user], default: :new_user

  before_create do
    self.id = "usr#{SecureRandom.base64(32)}"
  end

  after_create do
    Users::RegistrationWorker.perform_at(23.hours.from_now, id)
  end

  # for third party authentication
  def self.from_omniauth(auth)
    email = auth.dig(:info, :email)
    return unless email

    where(email: email).first_or_initialize do |user|
      user.email = email
      user.password = SecureRandom.base58(32)
      user.confirmed_by_email = true
    end
  end
end
