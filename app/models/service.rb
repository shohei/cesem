class Service < ApplicationRecord
    belongs_to :billing
    has_one :item
end
