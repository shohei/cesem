class CreateEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :equipments do |t|
      t.integer :user_id
      t.string :name
      t.string :name_of_model
      t.text :model_number
      t.text :serial_number
      t.string :inventory_number
      t.integer :acquired_year
      t.string :location
      t.string :manufacturer
      t.string :country_of_origin
      t.string :warranty_period
      t.integer :additional_info, array: true, default: []
      t.text :other_info
      t.integer :dealer_id

      t.integer :internal_number
      t.string :serial_number
      t.string :manufacturer
      t.string :remark
      t.integer :price
      t.text :description
      t.integer :quantity
      t.string :where_purchased
      t.integer :department_id

      t.timestamps
    end
  end
end
