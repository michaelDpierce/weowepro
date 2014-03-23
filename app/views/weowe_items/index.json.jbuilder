json.array!(@weowe_items) do |weowe_item|
  json.extract! weowe_item, :id
  json.url weowe_item_url(weowe_item, format: :json)
end
