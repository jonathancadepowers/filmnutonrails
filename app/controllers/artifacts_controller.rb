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
    @artifact.artifact_file.attach(params[:artifact][:artifact_file])
    @artifact.save ? create_success : create_error(artifact)
  end

  def destroy
    @artifact = Artifact.find(params[:id])
    @artifact.destroy ? destroy_success : destroy_error(@artifact)
    redirect_to(controller: "artifacts", action: "index")
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

  private

  def artifact_params
    params.require(:artifact).permit(
      :title,
      :artifact_file
    )
  end
end
