json.array!(@users) do |user|
  json.extract! user, *User.column_names

  json.url user_url(user)
end
