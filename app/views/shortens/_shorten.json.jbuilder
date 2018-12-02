json.extract! shorten, :id, :short_url, :real_url, :count, :created_at, :updated_at
json.url shorten_url(shorten, format: :json)
