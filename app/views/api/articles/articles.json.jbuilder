json.array! @articles.each do |article|
  json.headline article.headline
  json.category_id article.category_id
  json.date article.date
  json.link article.link
end