# frozen_string_literal: true

module StandardItemHelper
  include Rails.application.routes.url_helpers

  # Creates a polymorphic object that basic CRUD methods can leverage.
  # Used by methods in StandardItemController.
  def set_object
    instance_variable_get("@#{controller_name.singularize}")
  end

  def destroy_object_and_life_log(object)
    ll_result = object.life_log.present? ? object.life_log.destroy : false
    obj_result = object.destroy
    ll_result && obj_result ? true : false
  end

  # TODO: There must be a less-hardcody way to handle this.
  def nice_controller_name(controller_name)
    { "films" => "film",
      "tv_shows" => "show",
      "blog_posts" => "post",
      "artifacts" => "artifact",
      "runs" => "run",
      "podcast_episodes" => "podcast episode",
      "books" => "book" }[controller_name]
  end

  def object_label(controller_name)
    controller_name.to_s.singularize.titleize
  end

  def object_collection(controller_name)
    instance_variable_get("@all_" + controller_name)
  end

  def object_edit_path(object)
    url_for(action: :edit, id: object.id)
  end

  def create_success
    flash[:notice] = "The new
      #{nice_controller_name(controller_name)} was added."
    redirect_to(controller: controller_name.to_s, action: "index")
  end

  def create_error(object)
    flash[:error] = "Uh oh!
        Something went wrong when attempting to submit your update.
          Error(s): " + object.errors.full_messages.to_sentence
    render action: "new"
  end

  def destroy_success
    flash[:notice] = "The
        #{nice_controller_name(controller_name)} was deleted."
  end

  def destroy_error(object)
    flash[:error] = "An error occured while
        attempting to delete the
        #{nice_controller_name(controller_name)}.
        Error(s): " + object.errors.full_messages.to_sentence
  end

  def update_success
    flash[:notice] = "The
      #{nice_controller_name(controller_name)} was updated."
    redirect_to(controller: controller_name.to_s, action: "index")
  end

  def update_error(object)
    flash[:error] = "Uh oh!
        Something went wrong when attempting to submit your update.
        Errors: " + object.errors.full_messages.to_sentence
    redirect_to action: :edit
  end
end
