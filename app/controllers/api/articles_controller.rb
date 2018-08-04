class Api::ArticlesController < ApplicationController
  before_action :authenticate_user

  def index
    response = Unirest.get(
      "https://content.guardianapis.com/sport/2018/aug/01/womens-european-tour-laura-davies-golf?show-blocks=all&api-key=#{ENV["API_KEY"]}")
    render json: response.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
  end
  
  # may not need this along with route
  def read
    @history = History.where(user_id: current_user)
    # render json: [message: "went through"]
    render "histories.json.jbuilder"
  end

end
