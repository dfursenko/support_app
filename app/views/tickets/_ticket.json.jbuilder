json.extract! ticket, :id, :user_id, :body, :moderator_id, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
