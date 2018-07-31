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
    @article = Article.where(category_id: 1)
    render "show.json.jbuilder"
  end
end
