json.extract! todo, :id, :title, :creator_id, :completed, :completed_by, :created_at, :updated_at
json.url todo_url(todo, format: :json)
