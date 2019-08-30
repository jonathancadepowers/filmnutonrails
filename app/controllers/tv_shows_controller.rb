# frozen_string_literal: true

class TvShowsController < ApplicationController
  def create
    @tv_show = TvShow.new(tv_show_params)
    super # Parent method lives in ApplicationController.
  end

  def destroy
    @tv_show = TvShow.find(params[:id])
    super # Parent method lives in ApplicationController.
  end

  def edit
    @tv_show = TvShow.find(params[:id])
  end

  def index
    @all_tv_shows = TvShow.all.order("watched_on DESC")
  end

  def new
    @tv_show = TvShow.new
  end

  def update
    @result = TvShow.find(params[:id]).update(tv_show_params)
    super # Parent method lives in ApplicationController.
  end

  private

  def tv_show_params
    params.require(:tv_show).permit(
      :title,
      :url,
      :rating,
      :watched_on
    )
  end
end
