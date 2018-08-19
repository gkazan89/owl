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

      # link = response.body["response"]["results"][0]["apiUrl"] 
      link = get_unread_article_url(response.body["response"]["results"])
      
      link += "?show-blocks=all&show-tags=contributor&api-key=#{ENV["API_KEY"]}"
      article = Unirest.get(link)
      article_title = article.body["response"]["content"]["webTitle"]
      pic = article.body["response"]["content"]["blocks"]["main"]["elements"][0]["assets"].pop
      article_image = pic[:file]
      article_body = article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
      if article.body["response"]["content"]["tags"][0]
        article_author = article.body["response"]["content"]["tags"][0]["webTitle"]
      else
        article_author = "No author available"
      end

      @articles << {
        title: article_title, 
        image: article_image,
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


  def read
    @stories = current_user.histories.where(status: "unread")
    render "histories.json.jbuilder"
  end

end
