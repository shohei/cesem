class AddCanceledAtToMaintenance < ActiveRecord::Migration[5.2]
  def change
     add_column :maintenances, :canceled_at, :date
  end
end
