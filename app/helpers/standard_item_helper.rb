# frozen_string_literal: true

module StandardItemHelper
  include Rails.application.routes.url_helpers

  # Creates a polymorphic object that basic CRUD methods can leverage.
  # Used by methods in StandardItemController.
  def set_object
    instance_variable_get("@#{controller_name.singularize}")
  end

  def nice_controller_name(controller_name)
    { "films" => "film",
      "tv_shows" => "show",
      "blog_posts" => "post",
      "artifacts" => "artifact",
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
end
