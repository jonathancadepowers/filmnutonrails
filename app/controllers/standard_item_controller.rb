# frozen_string_literal: true

class StandardItemController < ApplicationController
  include StandardItemHelper

  layout "admin"

  before_action :authenticate_user!

  def create
    object = set_object
    ll_result = object.create_life_log(
      display_timestamp: @display_timestamp,
      related_object_type: controller_name.singularize
    )
    object.save && ll_result ? create_success : create_error(object)
  end

  def destroy
    object = set_object
    result = destroy_object_and_life_log(object)
    result ? destroy_success : destroy_error(object)
    redirect_to(controller: controller_name.to_s, action: "index")
  end

  def update
    ll_result = @object.life_log
                       .update(display_timestamp: @display_timestamp)
    @object_result && ll_result ? update_success : update_error(@object)
  end

  def new_parent_params(parent_name, child_title, params)
    params["title"] = params[parent_name + "_attributes"]["title"] +
                      " - " + child_title
    params.delete parent_name + "_id"
    params
  end

  def existing_parent_params(parent_name, child_title, params)
    params["title"] = Object.const_get(parent_name.split("_")
                                                  .map(&:capitalize)
                                                  .join(""))
                            .find(params[parent_name + "_id"])
                            .title + " - " + child_title
    params.delete parent_name + "_attributes"
    params
  end
end
