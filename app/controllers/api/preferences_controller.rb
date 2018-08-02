class Api::PreferencesController < ApplicationController
  def index
    render json: {message: "Went through"}
  end

  def create
    @pref = Preference.new(
      user_id: params[:user_id],
      category_id: params[:category_id],
      )
    @pref.save
    render "show.json.jbuilder"
  end
end
