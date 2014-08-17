json.array!(@demos) do |demo|
  json.extract! demo, :id, :first_name, :last_name, :phone_number, :email, :dealership
  json.url demo_url(demo, format: :json)
end
