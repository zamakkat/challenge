json.array!(@volumes) do |volume|
  json.extract! volume, :month, :year, :address, :publisher, :url
  json.url volume_url(volume, format: :json)
end
