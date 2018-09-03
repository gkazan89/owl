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


#####################################################
#####################################################
## THIS TEST METHOD WORKS, DO NOT DELETE!!!! ##


# def test
#   # [{sports: [...articles...], currentArticleIndex: 0}, {weather: [...articles...]}]
#   @preferences = Category.all
#   @things = @preferences.map{|cat| {"category"=>cat.name}}
#   @things.each do |thing|
#     type = thing["category"]
#     response = Unirest.get(
#       "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}")
#     results = response.body["response"]["results"]
#     thing[:data] = results
#     thing[:currentArticleIndex] = 0
#     thing[:currentArticleVisible] = false
#   end
#   render json: @things
# end

#####################################################
#####################################################


# test edits here first, then move over to the view method
  # pics = []
  # dex = 0

  def test
    # [{sports: [...articles...], currentArticleIndex: 0}, {weather: [...articles...]}]
    @preferences = Category.all
    @things = @preferences.map{|cat| {"category"=>cat.name}}
    @things.each do |thing|
      type = thing["category"]
      response = Unirest.get(
        "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}")
      @results = response.body["response"]["results"]
      thing[:data] = @results.map do |result|
        result["imageUrl"] = nil
        result
      end 
      thing[:currentArticleIndex] = 0
      thing[:currentArticleVisible] = false
    end
    render json: @things
  end

  ## given apiURL in params, make webrequest to the guardian api to retrieve image (the one that will fit of course)
  ## for author &show-tags=contributor (in web request)

  def pic 
    link = params["api_URL"]
    tail = "?show-blocks=all&api-key=#{ENV["API_KEY"]}"
    response = Unirest.get(link + tail)
    @pics = response.body["response"]["content"]["blocks"]["main"]["elements"][0]["assets"]
    @pics.each do |pic|
      if pic["typeData"]["isMaster"] == true
        @img = pic["file"]
      end
    end
    render json: {img: @img}
  end

  # read individual article request from VueJS input
  def view
    # [{sports: [...articles...], currentArticleIndex: 0}, {weather: [...articles...]}]
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
      results = response.body["response"]["results"]
      # @articles << {type: type}
      @articles << results
      # link1 += key
      # article = Unirest.get(link1)
      # article_title = article.body["response"]["content"]["webTitle"]
      # pic = article.body["response"]["content"]["blocks"]["main"]["elements"][0]["assets"].pop
      # # article_image = pic["file"]
      # # article_body = article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
      # if article.body["response"]["content"]["tags"][0]
      #   article_author = article.body["response"]["content"]["tags"][0]["webTitle"]
      # else
      #   article_author = "No author available"
      # end
      # api_url = article.body["response"]["content"]["tags"][0]["apiUrl"]
      # link2 = response.body["response"]["results"][1]["apiUrl"]
      # link2title = response.body["response"]["results"][1]["webTitle"]

      # @articles << {
      #   title: article_title, 
      #   # master_image: article_image,
      #   category: type, 
      #   author: article_author,
      #   READ_THIS_apiUrl: link1,
      #   next_api_up: link2,
      #   next_title_up: link2title
      #   # body: article_body
      # }
      # save the article in History as unread
      # History.create(article_url: ..., status: "unread")
    end
    render json: @articles
  end


  # a single page web app that shows the three unread articles
  # user presses a button to read the article and the "next" button
  # spits out the next one they have yet to read

end
