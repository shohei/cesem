class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :service_id
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
