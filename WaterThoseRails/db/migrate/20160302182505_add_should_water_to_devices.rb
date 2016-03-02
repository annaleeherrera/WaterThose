class AddShouldWaterToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :should_water, :boolean
  end
end
