json.array!(@weowe_forms) do |weowe_form|
  json.extract! weowe_form, 
  json.url weowe_form_url(weowe_form, format: :json)
end