# frozen_string_literal: true

class ArtifactsController < StandardItemController
  def clipboard_copy
    data = {
      "clipboard_contents" => params[:artifact_path]
    }
    render json: data
  end

  def create
    @artifact = Artifact.new(artifact_params)
    super
  end

  def destroy
    @artifact = Artifact.find(params[:id])
    super
  end

  def edit
    @artifact = Artifact.find(params[:id])
  end

  def index
    @all_artifacts = Artifact.all.order("updated_at DESC")
  end

  def new
    @artifact = Artifact.new
  end

  def update
    @artifact = Artifact.find(params[:id])
    @result = @artifact.update(artifact_params)
    super
  end

  private

  def artifact_params
    params.require(:artifact).permit(
      :title,
      :artifact_file
    )
  end
end
