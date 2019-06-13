class School < ApplicationRecord
    belongs_to :college
    has_many :departments
end
