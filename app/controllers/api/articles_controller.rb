class Api::ArticlesController < ApplicationController
  before_action :authenticate_user

  # def index
  #   if current_user
  #     @articles = Article.all
  #     render "articles.json.jbuilder"
  #   else
  #     render json: [message: "not logged in..."]
  #   end  
  # end

  def index
    if current_user
      @articles = current_user.articles.all
      render "articles.json.jbuilder"
    else
      render json: [message: "not logged in..."]
    end  
  end
  
  # may not need this along with route
  def read
    @history = History.where(user_id: current_user)
    # render json: [message: "went through"]
    render "history.json.jbuilder"
  end


  # test route. remove when deploying

  # def test
  #   @stories = 
end
