class User < ActiveRecord::Base
  has_many :devices
  validates :email_address, presence: true
  validates :email_address, uniqueness: true
  validates :password, confirmation: true
   validates :password_confirmation, presence: true
  has_secure_password

  def create
    user = User.create
  end


end
