json.extract! event, :id, :title, :start_date, :duration, :description, :location, :price, :created_at, :updated_at
json.url event_url(event, format: :json)
