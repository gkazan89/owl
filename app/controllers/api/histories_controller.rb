class Api::HistoriesController < ApplicationController
  before_action :authenticate_user
  
  def index
    if current_user
      @histories = History.where(user_id: current_user)
      @stories = @histories.where(status: "unread")
      # render "articles.json.jbuilder"
      render "histories.json.jbuilder"
    else
      render json: [message: "not logged in..."]
    end  
  end

end
