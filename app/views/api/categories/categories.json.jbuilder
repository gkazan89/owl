json.array! @categories.each do |category|
  json.name category.name
end
