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
end
