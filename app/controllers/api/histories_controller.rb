class Api::HistoriesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @stories = current_user.histories.where(status: "unread")
    render "histories.json.jbuilder"
  end

end
