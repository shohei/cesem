class Billing < ApplicationRecord
    has_many :services
    belongs_to :maintenance
end
