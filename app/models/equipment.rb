class Equipment < ApplicationRecord
    belongs_to :user
    # belongs_to :dealer
    has_many :maintenances

    enum additional_info: [:user_manual, :technical_manual, :inspection_certificate, :calibration_certificate, :installed_and_commissioned]

end
