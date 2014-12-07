json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :names, :type, :trip_id, :album_id, :created_by_id, :url
  json.url attachment_url(attachment, format: :json)
end
