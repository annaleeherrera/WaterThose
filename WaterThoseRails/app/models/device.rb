class Device < ActiveRecord::Base
  belongs_to :user
  validates :mac_address, uniqueness: true

  def create
    device = Device.create
  end
end
