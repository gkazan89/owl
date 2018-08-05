# # console commands

# # to return an Article by category_ID

# Article.where(category_id: 1)

# Article.where(category_id: 2)

# p "hello dr. owl"

# This is the type of stuff we need!
# IT WORKED FOR THE OTHER ARTICLE!!!!!!!!!!
# We would've been kinda screwed if it didn't....
p hash[:response][:content][:blocks][:body][0][:bodyHtml]
# THIS LINE RIGHT HERE IS EVERYTHING!!!


# Get single article api from categories
require "Unirest"

preferences = ["technology", "weather"]
@articles = []

preferences.each do |preference|
  response = Unirest.get(
    "https://content.guardianapis.com/#{preference}?&api-key=#{ENV["API_KEY"]}")
  link = response.body["response"]["results"][0]["apiUrl"] 

  link += "?show-blocks=all&api-key=#{ENV["API_KEY"]}"

  article = Unirest.get(link)

  # p article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
  @articles << article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
end

p @articles
# render "index.json.jbuilder" # show all @articles

