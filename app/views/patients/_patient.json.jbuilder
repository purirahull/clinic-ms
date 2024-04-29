json.extract! patient, :id, :name, :phone_no, :user_id, :appointment_date, :age, :created_at, :updated_at
json.url patient_url(patient, format: :json)
