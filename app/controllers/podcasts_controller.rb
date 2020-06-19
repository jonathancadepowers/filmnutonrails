# frozen_string_literal: true

class PodcastsController < StandardItemController
  def index
    redirect_to(controller: "podcast_episodes", action: "index")
  end

  def destroy
    @podcast = Podcast.find(params[:id])
    @podcast.destroy ? destroy_success : destroy_error(@podcast)
    redirect_to(controller: "podcast_episodes", action: "index")
  end

  def edit
    @podcast = Podcast.find(params[:id])
    @episodes_count = @podcast.podcast_episodes.count
  end

  def podcast_lookup
    @podcast = Podcast.find(params[:selected_parent_id])
    render json: helpers.link_to("Edit Podcast Series",
                                 edit_podcast_url(@podcast),
                                 id: "parent_edit_link",
                                 target: "_blank", rel: "noopener")
  end

  def update
    @podcast = Podcast.find(params[:id])
    @podcast.update(podcast_params) ? update_success : update_error(@podcast)
  end
end

private

def podcast_params
  params.require(:podcast).permit(
    :title,
    :url,
    :selected_podcast_id
  )
end
