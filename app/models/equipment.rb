class Equipment < ApplicationRecord
    belongs_to :user
    has_many :maintenances

    enum additional_info: [:user_manual, :technical_manual, :inspection_certificate, :calibration_certificate, :installed_and_commissioned]
    enum status:  { working: 0, repairable: 1, abandoned: 2}

    paginates_per 50

end
