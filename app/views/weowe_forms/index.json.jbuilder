json.array!(@index) do |form|
  json.extract! form, *WeoweForm.column_names

  json.user do
    json.id form.user.id
    json.first_name form.user.first_name
    json.last_name form.user.last_name
  end

  json.url form_url(form)
end
