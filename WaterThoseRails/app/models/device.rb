class Device < ActiveRecord::Base
  belongs_to :user

  def create
    device = Device.create
  end
end
