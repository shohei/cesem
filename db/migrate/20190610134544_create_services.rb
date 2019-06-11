class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :billing_id
      t.integer :amount

      t.timestamps
    end
  end
end
