class AddCancelRequestedAtToMaintenance < ActiveRecord::Migration[5.2]
  def change
     add_column :maintenances, :cancel_requested_at, :date
  end
end
