class RenameShouldWaterToManualWateringRequested < ActiveRecord::Migration
  def change
    rename_column :devices, :should_water, :manual_watering_requested
  end
end
