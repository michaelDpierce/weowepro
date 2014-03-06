json.array!(@dealers) do |dealer|
  json.extract! dealer, :name
  json.url dealer_url(dealer, format: :json)
end