json.extract! event, :id, :name, :datestart, :dateEnd, :location, :type, :shortDesc, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
