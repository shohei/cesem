class Equipment < ApplicationRecord
    belongs_to :user
    has_many :maintenances
    belongs_to :dealer

    enum additional_info: [:user_manual, :technical_manual, :inspection_certificate, :calibration_certificate, :installed_and_commissioned]

    def self.instance_method_already_implemented?(method_name)
      return true if method_name == 'model_name'
      super
    end
end
