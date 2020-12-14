class User < ApplicationRecord
  before_create :generate_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :auth_token, uniqueness: true

  def generate_token
    loop do
      self.auth_token = Devise.friendly_token
      break unless self.class.exists?(auth_token: auth_token)
    end
  end
end
