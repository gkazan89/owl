class Api::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render "articles.json.jbuilder"
  end
end
