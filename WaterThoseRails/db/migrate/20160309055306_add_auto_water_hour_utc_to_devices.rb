class AddAutoWaterHourUtcToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :auto_water_hour_utc, :integer
  end
end
