class Equipment < ApplicationRecord
    belongs_to :user
    has_many :maintenances
    belongs_to :dealer

    def self.instance_method_already_implemented?(method_name)
      return true if method_name == 'model_name'
      super
    end
end
