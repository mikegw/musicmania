json.array!(@albums) do |album|
  json.extract! album, :id, :name, :band_id, :recording_type
  json.url album_url(album, format: :json)
end
