json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :album_id, :track_type, :lyrics
  json.url track_url(track, format: :json)
end
