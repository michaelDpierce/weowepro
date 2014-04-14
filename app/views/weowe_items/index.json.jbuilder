json.array!(@weowe_items) do |weowe_item|
  json.extract! weowe_item, *WeoweItem.column_names
end
