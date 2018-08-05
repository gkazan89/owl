json.array! @preferences.each do |pref|
  json.user_id pref.user_id
  json.category_id pref.category_id
end