class RemoveDeviceIdFromDevices < ActiveRecord::Migration
  def change
    remove_column :devices, :device_id, :integer
  end
end
