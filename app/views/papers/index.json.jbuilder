json.array!(@papers) do |paper|
  json.extract! paper, :title, :month, :year, :address, :publisher, :url
  json.url paper_url(paper, format: :json)
end
