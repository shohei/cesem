class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.integer :college_id
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
