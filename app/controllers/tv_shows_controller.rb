# frozen_string_literal: true

class TvShowsController < StandardItemController
  def destroy
    @tv_show = TvShow.find(params[:id])
    @tv_show.destroy ? destroy_success : destroy_error(@tv_show)
    redirect_to(controller: "tv_show_seasons", action: "index")
  end

  def edit
    @tv_show = TvShow.find(params[:id])
    @seasons_count = @tv_show.tv_show_seasons.count
  end

  def tv_show_lookup
    @tv_show = TvShow.find(params[:selected_parent_id])
    render json: helpers.link_to("Edit TV Show",
                                 edit_tv_show_url(@tv_show),
                                 id: "tv_show_edit_link",
                                 target: "_blank", rel: "noopener")
  end

  def index
    redirect_to(controller: "tv_show_seasons", action: "index")
  end

  def update
    @tv_show = TvShow.find(params[:id])
    @tv_show.update(tv_show_params) ? update_success : update_error(@tv_show)
  end

  private

  def tv_show_params
    params.require(:tv_show).permit(
      :title,
      :url,
      :selected_parent_id
    )
  end
end
