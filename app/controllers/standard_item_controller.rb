# frozen_string_literal: true

class StandardItemController < ApplicationController
  include StandardItemHelper

  layout "admin"

  before_action :authenticate_user!

  # Generic instance creation method.
  def create
    object = set_object
    object.create_life_log(display_timestamp: @display_timestamp,
                           related_object_type: controller_name.singularize)
    if object.save == true
      flash[:notice] = "The new
        #{nice_controller_name(controller_name)} was added."
      redirect_to(controller: controller_name.to_s, action: "index")
    else
      render action: "new"
    end
  end

  # Generic instance destruction method.
  def destroy
    object = set_object
    result = destroy_object_and_life_log(object)
    if result
      flash[:notice] = "The
        #{nice_controller_name(controller_name)} was deleted."
    else
      flash[:error] = "An error occured while
        attempting to delete the
        #{nice_controller_name(controller_name)}."
    end
    redirect_to(controller: controller_name.to_s, action: "index")
  end

  # Generic instance update method.
  def update
    @life_log_result = @object.life_log
                              .update(display_timestamp: @display_timestamp)
    if @object_result == true && @life_log_result == true
      flash[:notice] = "The
      #{nice_controller_name(controller_name)} was updated."
      redirect_to(controller: controller_name.to_s, action: "index")
    else
      flash[:error] = "Uh oh!
        Something went wrong when attempting to submit your update."
      redirect_to action: :edit
    end
  end
end
