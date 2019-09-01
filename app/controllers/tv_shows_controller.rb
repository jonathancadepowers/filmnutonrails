# frozen_string_literal: true

class TvShowsController < StandardItemController
  def create
    @tv_show = TvShow.new(tv_show_params)
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
    @tv_show = TvShow.find(params[:id])
    @result = @tv_show.update(tv_show_params)
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
