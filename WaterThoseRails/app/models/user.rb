class User < ActiveRecord::Base
  has_many :devices
  validates :email_address, presence: true
  validates :email_address, uniqueness: true
  # validates_confirmation_of :password
  has_secure_password

  def create
    user = User.create
  end
end
