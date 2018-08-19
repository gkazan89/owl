class Api::HistoriesController < ApplicationController
  before_action :authenticate_user
  
# view unread articles
  def index
    @stories = current_user.histories.where(status: "unread")
    render "histories.json.jbuilder"
  end

# adds 3 articles to db with status unread
  def create
    @articles = []
    @types = []
    @preferences = current_user.preferences.all
    @preferences.each do |pref|
      @types << pref.category.name
    end
    @types.each do |type|
      response = Unirest.get(
        "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}"
        )
      link = response.body["response"]["results"][0]["apiUrl"]
      @articles << link
    end
    @articles.each do |story|
      link = History.new(
        status: "unread",
        user_id: current_user.id,
        api_url: story,
        )
      link.save
    end
    render json: "success!"
  end

  def test
    @stories = current_user.histories
    render "histories.json.jbuilder"
  end

end
