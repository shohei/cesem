json.extract! equipment, :id, :user_id, :name, :name_of_model, :model_number, :serial_number, :inventory_number, :acquired_year, :location, :manufacturer, :country_of_origin, :warranty_period, :additional_info, :other_info, :dealer_id, :created_at, :updated_at
json.url equipment_url(equipment, format: :json)
