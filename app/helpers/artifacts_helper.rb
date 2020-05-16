# frozen_string_literal: true

module ArtifactsHelper
  def build_artifact_form(action_name, field)
    if action_name == "new"
      render partial: "new_artifact_form", locals: { f: field }
    elsif action_name == "edit"
      render "existing_artifact_form"
    end
  end
end
