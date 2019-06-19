class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string,  null: false
    add_column :users, :role, :integer, null: false, default: 2
  end
end
