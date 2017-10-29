class User < ApplicationRecord
  has_secure_password

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  before_create :generate_confirmation_token

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex
  end
end
