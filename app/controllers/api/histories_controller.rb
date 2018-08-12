class Api::HistoriesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @stories = current_user.histories.where(status: "unread")
    render "histories.json.jbuilder" 
  end

  # def create
  #   @history = History.new(
  #     status: params[:status],
  #     user_id: current_user.id,
  #     )
  #   @history.save
  #   render "show.json.jbuilder"
  # end

end
