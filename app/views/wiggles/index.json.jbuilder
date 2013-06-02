json.array!(@wiggles) do |wiggle|
  json.extract! wiggle, :name
  json.url wiggle_url(wiggle, format: :json)
end