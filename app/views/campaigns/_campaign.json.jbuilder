json.extract! campaign, :id, :title, :tags, :duration, :creator_id, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
