# frozen_string_literal: true

class PodcastEpisodesController < StandardItemController
  skip_before_action :authenticate_user!, only: [:all]
  before_action :hydrate_sidebar_data, only: %i[all]

  def all
    @all_podcast_episodes = PodcastEpisode.all.order("created_at DESC")
    render layout: "main"
  end

  def create
    new_params = build_new_params
    @podcast_episode = PodcastEpisode.new(new_params)
    @display_timestamp = @podcast_episode.consumed_on
    super
  end

  def destroy
    @podcast_episode = PodcastEpisode.find(params[:id])
    super
  end

  def edit
    @podcast_episode = PodcastEpisode.find(params[:id])
  end

  def index
    @all_podcast_episodes = PodcastEpisode.all.order("updated_at DESC")
  end

  def new
    @podcast_episode = PodcastEpisode.new
  end

  def update
    new_params = build_new_params
    @object = PodcastEpisode.find(params[:id])
    @object_result = @object.update(new_params)
    @display_timestamp = @object.consumed_on
    super
  end

  private

  def podcast_episode_params
    params.require(:podcast_episode).permit(
      :title,
      :reaction,
      :consumed_on,
      :podcast_id,
      :create_new_podcast_option,
      podcast_attributes: %i[title url]
    )
  end

  def build_new_params
    new_params = podcast_episode_params
    if new_params[:create_new_podcast_option].to_i == 1
      new_params.delete :podcast_id
    else
      new_params.delete :podcast_attributes
    end
    new_params
  end
end
