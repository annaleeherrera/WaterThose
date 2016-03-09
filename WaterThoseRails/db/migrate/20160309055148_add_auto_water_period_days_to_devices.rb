class AddAutoWaterPeriodDaysToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :auto_water_period_days, :integer
  end
end
