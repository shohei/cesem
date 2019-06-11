json.extract! maintenance, :id, :user_id, :equipment_id, :description, :precaution, :trace_number, :diagnosis, :status, :scheduled_at, :completion_expected_at, :recomission_projected_at, :other_status, :created_at, :updated_at
json.url maintenance_url(maintenance, format: :json)
