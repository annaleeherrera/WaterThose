class RenameLastAutoWaterTimeToLastAutoWaterDate < ActiveRecord::Migration
  def change
    rename_column :devices, :last_auto_water_time, :last_auto_water_date
  end
end
