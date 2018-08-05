json.array! @categories.each do |category|
  json.name category.name
  json.category_id category.id
end
