class Maintenance < ApplicationRecord
    belongs_to :user
    belongs_to :equipment

    enum status: [:fault_identified, :repair_or_maintenance_scheduled, :spare_parts_purchased_and_delivered]

end
