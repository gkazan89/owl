class Api::ArticlesController < ApplicationController
  before_action :authenticate_user

  def index
    @articles = []
    @types = []
    @preferences = current_user.preferences.all
    @preferences.each do |pref|
      @types << pref.category.name
    end
    @types.each do |type|
      response = Unirest.get(
        "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}")

      # link1 = response.body["response"]["results"][0]["apiUrl"] 
      link = get_unread_article_url(response.body["response"]["results"])
      
      link += "?show-blocks=all&show-tags=contributor&api-key=#{ENV["API_KEY"]}"
      article = Unirest.get(link)
      article_title = article.body["response"]["content"]["webTitle"]
      pic = article.body["response"]["content"]["blocks"]["main"]["elements"][0]["assets"].pop
      article_image = pic["file"]
      article_body = article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
      if article.body["response"]["content"]["tags"][0]
        article_author = article.body["response"]["content"]["tags"][0]["webTitle"]
      else
        article_author = "No author available"
      end

      @articles << {
        title: article_title, 
        master_image: article_image,
        category: type, 
        author: article_author,
        body: article_body
      }
      # save the article in History as unread
      # History.create(article_url: ..., status: "unread")
    end
    render json: @articles
  end


  # a single page web app that shows the three unread articles
  # user presses a button to read the article and the "next" button
  # spits out the next one they have yet to read

  
  def get_unread_article_url(results)
    # loop through results (results.each do |result|)
    # if result["id"] is NOT in History.all
    #   save the result["id"] into the History data
    #   return result["apiUrl"]
    # if you hit the end of the loop, return nil ?
    results[0]["apiUrl"]
  end


# switch articles via pressing a button
  def test
    @articles = []
    @types = []
    @preferences = Category.all
    @preferences.each do |pref|
      @types << pref.name
    end
    @types.each do |type|
      response = Unirest.get(
        "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}")
      link = response.body["response"]["results"][0]["apiUrl"] 
      link += "?show-blocks=all&show-tags=contributor&api-key=#{ENV["API_KEY"]}"
      article = Unirest.get(link)
      article_title = article.body["response"]["content"]["webTitle"]
      # pic = article.body["response"]["content"]["blocks"]["main"]["elements"][0]["assets"].pop
      # article_image = pic["file"]
      # article_body = article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
      if article.body["response"]["content"]["tags"][0]
        article_author = article.body["response"]["content"]["tags"][0]["webTitle"]
      else
        article_author = "No author available"
      end
      @articles << {
        title: article_title, 
        # master_image: article_image,
        category: type, 
        author: article_author,
        # body: article_body
      }
      # save the article in History as unread
      # History.create(article_url: ..., status: "unread")
    end
    render json: @articles
  end

  # read individual article request from VueJS input
  # this can probably be refactored to something better...
  def view
    @articles = []
    @types = []
    @preferences = Category.all
    @preferences.each do |pref|
      @types << pref.name
    end
    key = "?show-blocks=all&show-tags=contributor&api-key=#{ENV["API_KEY"]}"
    @types.each do |type|
      response = Unirest.get(
        "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}")
      link1 = response.body["response"]["results"][0]["apiUrl"] 
      link1 += key
      article = Unirest.get(link1)
      article_title = article.body["response"]["content"]["webTitle"]
      # pic = article.body["response"]["content"]["blocks"]["main"]["elements"][0]["assets"].pop
      # article_image = pic["file"]
      # article_body = article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
      if article.body["response"]["content"]["tags"][0]
        article_author = article.body["response"]["content"]["tags"][0]["webTitle"]
      else
        article_author = "No author available"
      end
      api_url = article.body["response"]["content"]["tags"][0]["apiUrl"]

      ## article 2
      response2 = Unirest.get(
        "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}") 
      link2 = response.body["response"]["results"][1]["apiUrl"]

      @articles << {
        title: article_title, 
        # master_image: article_image,
        category: type, 
        author: article_author,
        READ_THIS_apiUrl: link1,
        next_api_up: link2
        # body: article_body
      }
      # save the article in History as unread
      # History.create(article_url: ..., status: "unread")
    end
    render json: @articles
  end


  # a single page web app that shows the three unread articles
  # user presses a button to read the article and the "next" button
  # spits out the next one they have yet to read

end
