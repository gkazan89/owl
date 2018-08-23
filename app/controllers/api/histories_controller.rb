class Api::HistoriesController < ApplicationController
  before_action :authenticate_user
  
# view unread articles and change to read
# happy/sad path
  def index
    @stories = current_user.histories.where(status: "unread")
    if @stories.length > 1
      @stories.each do |story|
        story.status = "read"
        story.save
        render "histories.json.jbuilder"
        break
      end
    else
      render json: {message: "no articles available"}
    end
  end

# adds 3 articles to db with status unread
# need to check if article is already there
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

  # checking histories for unread articles 
  # moving to next item in categories JSON if article is already in db
  # there's probably a sorting algorithm or something we can use to do 
  # the search efficiently
  def test
    @articles = []
    @types = []
    @preferences = current_user.preferences.all
    @preferences.each do |pref|
      @types << pref.category.name
    end
    num = 0
    # get three new articles
    @types.each do |type|
      response = Unirest.get(
        "https://content.guardianapis.com/#{type}?&api-key=#{ENV["API_KEY"]}"
        )
      link = response.body["response"]["results"][num]["apiUrl"]
      @articles << link
    end
    check = current_user.histories.all
    blank = []
    check.each do |url|
      blank << url.api_url
    end
    @articles.each do |story|

    end
      # link = History.new(
      #   status: "unread",
      #   user_id: current_user.id,
      #   api_url: story,
      #   )
      # link.save
    # render json: "success!"
  end
end
