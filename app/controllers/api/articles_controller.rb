class Api::ArticlesController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      @articles = Article.all
      render "articles.json.jbuilder"
    else
      render json: []
    end  
  end
end
