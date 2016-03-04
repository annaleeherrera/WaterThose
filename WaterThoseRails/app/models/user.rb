class User < ActiveRecord::Base
  has_many :devices
  
  def create
    user = User.create
  end


end
