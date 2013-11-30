json.array!(@authors) do |author|
  json.extract! author, :Firstname, :Lastname
  json.url author_url(author, format: :json)
end
