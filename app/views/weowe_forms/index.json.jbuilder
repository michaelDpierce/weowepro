json.array!(@index) do |form|
  json.extract! form, :id
  json.extract! form, :custom_date
  json.extract! form, :stock_number
  json.extract! form, :year
  json.extract! form, :make
  json.extract! form, :vehicle_model
  json.extract! form, :color
  json.extract! form, :customer_last_name
  json.extract! form, :customer_first_name
  json.extract! form, :dealer_total_value

  json.user do
    json.id form.user.id
    json.first_name form.user.first_name
    json.last_name form.user.last_name
  end
end
