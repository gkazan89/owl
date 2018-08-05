json.array! @articles.each do |article|
  json.headline article.headline
  json.link article.link
end