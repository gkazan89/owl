json.array! @stories.each do |story|
  json.article story.api_url
  json.status story.status
end