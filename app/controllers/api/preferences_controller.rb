class Api::PreferencesController < ApplicationController
  before_action :authenticate_user

  def index
    @preferences = Preference.all
    render "index.json.jbuilder"
  end

  def create
    @pref = Preference.new(
      user_id: current_user.id,
      category_id: params[:category_id],
      )
    @pref.save
    render "show.json.jbuilder"
  end

  # may not need this action below:
  def update
    @pref = Preference.find_by(id: params[:id])
    @pref.user_id = params[:user_id] || @pref.user_id
    @pref.category_id = params[:category_id] || @pref.category_id
    @pref.save
    render "show.json.jbuilder"
  end
end
