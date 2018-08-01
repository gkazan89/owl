json.array! @stories.each do |story|
  json.article story.article.headline
  json.link story.article.link
  json.status story.status
end