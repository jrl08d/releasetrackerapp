json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :issue_id
  json.url comment_url(comment, format: :json)
end
