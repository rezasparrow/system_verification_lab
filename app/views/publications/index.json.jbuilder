json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :year, :publisher_id, :page, :volume, :journal_id
  json.url publication_url(publication, format: :json)
end
