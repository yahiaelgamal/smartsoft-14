json.array!(@drivers) do |driver|
  json.extract! driver, :id, :name, :phone, :address
  json.url driver_url(driver, format: :json)
end
