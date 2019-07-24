class Maintenance < ApplicationRecord
    belongs_to :user
    belongs_to :equipment

    enum status: {todo: 0, fault_identified: 1, repair_or_maintenance_scheduled: 2, spare_parts_purchased_and_delivered: 3, pend: 4, completed: 5, cancel_requested: 6, canceled: 7}

end
