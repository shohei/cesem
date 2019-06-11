class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.integer :user_id
      t.string :name
      t.string :model_name
      t.string :model_number
      t.string :serial_number
      t.string :inventory_number
      t.date :acquired_at
      t.string :location
      t.string :manufacturer
      t.string :country_of_origin
      t.string :warranty_period
      t.integer :additional_info
      t.text :other_info
      t.integer :dealer_id

      t.timestamps
    end
  end
end
