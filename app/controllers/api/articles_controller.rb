class Api::ArticlesController < ApplicationController
  before_action :authenticate_user

# This is a good bit!
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
      link = response.body["response"]["results"][0]["apiUrl"] 
      link += "?show-blocks=all&api-key=#{ENV["API_KEY"]}"
      article = Unirest.get(link)
      @articles << {type: type, body: article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]}
    end
    render json: @articles
  end


  # may not need this along with route
  def read
    @blank = []
    @articles = current_user.preferences.all
    # render json: [message: "went through"]
    @articles.each do |article|
      @blank << article.category.name
    end
    render json: @blank
  end
end
