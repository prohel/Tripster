json.array!(@attachment_ratings) do |attachment_rating|
  json.extract! attachment_rating, :id, :user_id, :score, :attachment_id
  json.url attachment_rating_url(attachment_rating, format: :json)
end
