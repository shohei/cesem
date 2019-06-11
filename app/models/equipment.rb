class Equipment < ApplicationRecord
    belongs_to :user
    belongs_to :dealer
    has_many :maintenance, dependent: :destroy
end
