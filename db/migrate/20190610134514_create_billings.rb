class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.integer :maintenance_id

      t.timestamps
    end
  end
end
