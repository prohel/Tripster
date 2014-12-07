json.array!(@albums) do |album|
  json.extract! album, :id, :trip_id, :name, :created_by_id
  json.url album_url(album, format: :json)
end
