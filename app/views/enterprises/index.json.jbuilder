json.array!(@enterprises) do |enterprise|
  json.extract! enterprise, :id, :name, :description, :region_id, :phone_number, :postal_code
  json.url enterprise_url(enterprise, format: :json)
end
