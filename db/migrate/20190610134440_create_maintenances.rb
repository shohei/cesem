class CreateMaintenances < ActiveRecord::Migration[5.2]
  def change
    create_table :maintenances do |t|
      t.integer :user_id
      t.integer :equipment_id
      t.text :description
      t.text :precaution
      t.string :trace_number
      t.text :diagnosis
      t.integer :status
      t.date :scheduled_at
      t.date :completion_expected_at
      t.date :recomission_projected_at
      t.text :other_status

      t.timestamps
    end
  end
end
