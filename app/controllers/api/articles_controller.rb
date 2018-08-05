class Api::ArticlesController < ApplicationController
  before_action :authenticate_user

  # def index
  #   response = Unirest.get(
  #     "https://content.guardianapis.com/sport/2018/aug/01/womens-european-tour-laura-davies-golf?show-blocks=all&api-key=#{ENV["API_KEY"]}")
  #   render json: response.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
  # end

  def index
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
    render json: @articles
  end


  # may not need this along with route
  def read
    @history = History.where(user_id: current_user)
    # render json: [message: "went through"]
    render "histories.json.jbuilder"
  end

end
