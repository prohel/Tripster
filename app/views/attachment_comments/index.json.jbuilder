json.array!(@attachment_comments) do |attachment_comment|
  json.extract! attachment_comment, :id, :user_id, :text, :attachment_id
  json.url attachment_comment_url(attachment_comment, format: :json)
end
