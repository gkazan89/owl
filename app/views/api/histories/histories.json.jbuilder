json.array! @stories.each do |story|
  json.article_id story.article_id
  json.status story.status
end