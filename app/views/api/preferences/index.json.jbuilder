json.array! @preferences.each do |pref|
  json.user_email pref.user.email
  json.category pref.category.name
end