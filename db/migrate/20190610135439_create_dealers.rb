class CreateDealers < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :contact_person_name

      t.timestamps
    end
  end
end
