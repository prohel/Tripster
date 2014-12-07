json.array!(@album_ratings) do |album_rating|
  json.extract! album_rating, :id, :user_id, :score, :album_id
  json.url album_rating_url(album_rating, format: :json)
end
