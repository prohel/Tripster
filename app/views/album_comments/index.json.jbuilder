json.array!(@album_comments) do |album_comment|
  json.extract! album_comment, :id, :user_id, :text, :album_id
  json.url album_comment_url(album_comment, format: :json)
end
