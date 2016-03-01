class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :device_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
