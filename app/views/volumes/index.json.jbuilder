json.array!(@volumes) do |volume|
  json.extract! volume, :volume_id, :month, :year, :address, :publisher, :url, :bibtype, :bibkey
  json.url volume_url(volume, format: :json)
end
