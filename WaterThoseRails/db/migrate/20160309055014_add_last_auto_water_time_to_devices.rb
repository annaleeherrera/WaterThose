class AddLastAutoWaterTimeToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :last_auto_water_time, :date
  end
end
