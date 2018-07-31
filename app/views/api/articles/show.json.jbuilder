json.array! @article.each do |article|
  json.headline article.headline
  json.link article.link
end