json.extract! comment, :id, :commentable_id, :body, :published, :created_at, :updated_at
json.url comment_url(comment, format: :json)
