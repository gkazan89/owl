class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render "categories.json.jbuilder"
  end
end
