require 'securerandom'

class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates :api_key, uniqueness: true, presence: true

  before_validation :set_api_key

  has_secure_password

  private

  def set_api_key
    self.api_key = SecureRandom.base64
  end
end