# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "grant@email.com", password: "password")
User.create(email: "molly@email.com", password: "password")
User.create(email: "andrew@email.com", password: "password")

Category.create(name: "Tech")
Category.create(name: "US News")
Category.create(name: "Sports")

Article.create(category_id: 1, headline: "How to rails", date: 4.days.ago, link: "api_call1")
Article.create(category_id: 2, headline: "trump sucks", date: 5.days.ago, link: "api_call2")
Article.create(category_id: 3, headline: "Lebron Rules", date: 2.days.from_now, link:"api_call3")

History.create(user_id: 1, article_id: 1, status: "read")
History.create(user_id: 2, article_id: 2, status: "unread")
History.create(user_id: 3, article_id: 3, status: "skipped")

Preference.create(user_id: 1, category_id: 1)
Preference.create(user_id: 2, category_id: 2)
Preference.create(user_id: 3, category_id: 3)

