# frozen_string_literal: true

class TvShowSeasonsController < StandardItemController
  skip_before_action :authenticate_user!, only: [:all]
  def all
    @all_tv_show_seasons = TvShowSeason.all.order("consumed_on DESC")
    @total_seasons_count = TvShowSeason.count
    @seasons_watched_this_year = consumed_this_year(TvShowSeason)
    @seasons_grouped_by_ratings = build_rating_chart(TvShowSeason)
    render layout: "main"
  end

  def create
    new_params = build_new_params
    @tv_show_season = TvShowSeason.new(new_params)
    @display_timestamp = @tv_show_season.consumed_on
    super
  end

  def destroy
    @tv_show_season = TvShowSeason.find(params[:id])
    super
  end

  def edit
    @tv_show_season = TvShowSeason.find(params[:id])
  end

  def index
    @all_tv_show_seasons = TvShowSeason.all.order("updated_at DESC")
  end

  def new
    @tv_show_season = TvShowSeason.new
  end

  def update
    new_params = build_new_params
    @object = TvShowSeason.find(params[:id])
    @object_result = @object.update(new_params)
    @display_timestamp = @object.consumed_on
    super
  end

  private

  def tv_show_season_params
    params.require(:tv_show_season).permit(
      :title,
      :season_title,
      :url,
      :rating,
      :consumed_on,
      :tv_show_id,
      :create_new_tv_show_option,
      tv_show_attributes: %i[title url]
    )
  end

  def build_new_params
    create_new_parent = tv_show_season_params[:create_new_tv_show_option].to_i
    method = create_new_parent == 1 ? "new" : "existing"
    send(method + "_parent_params",
         "tv_show",
         tv_show_season_params["season_title"],
         tv_show_season_params)
  end
end
