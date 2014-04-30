json.array!(@index) do |form|
  json.extract! chemical_record, *WeoweForm.column_names

  json.user do
    json.last_name form.user.last_name
  end
end

