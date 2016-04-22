json.array!(@items) do |item|
  json.extract! item, :id, :description, :image, :url
  json.url item_url(item, format: :json)
end
