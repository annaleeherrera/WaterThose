class User < ActiveRecord::Base
  has_many :devices
  has_secure_password
  validates :email_address, uniqueness: true

  def create
    user = User.create
  end


end
