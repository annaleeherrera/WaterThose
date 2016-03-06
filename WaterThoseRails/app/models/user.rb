class User < ActiveRecord::Base
  has_many :devices
  has_secure_password

  def create
    user = User.create
  end


end
