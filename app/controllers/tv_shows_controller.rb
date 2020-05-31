# frozen_string_literal: true

class TvShowsController < StandardItemController
  skip_before_action :authenticate_user!, only: [:all]
  def all
    @all_tv_shows = TvShow.all.order("title ASC")
    @total_show_count = TvShow.count
    @shows_watched_this_year = consumed_this_year(TvShow)
    @shows_grouped_by_ratings = build_rating_chart(TvShow)
    render layout: "main"
  end

  def create
    @tv_show = TvShow.new(tv_show_params)
    @display_timestamp = @tv_show.consumed_on
    super
  end

  def destroy
    @tv_show = TvShow.find(params[:id])
    super
  end

  def edit
    @tv_show = TvShow.find(params[:id])
  end

  def index
    @all_tv_shows = TvShow.all.order("updated_at DESC")
  end

  def new
    @tv_show = TvShow.new
  end

  def update
    @object = TvShow.find(params[:id])
    @object_result = @object.update(tv_show_params)
    @display_timestamp = @object.consumed_on
    super
  end

  private

  def tv_show_params
    params.require(:tv_show).permit(
      :title,
      :url,
      :rating,
      :consumed_on
    )
  end
end
