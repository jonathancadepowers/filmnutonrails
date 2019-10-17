# frozen_string_literal: true

class StandardItemController < ApplicationController
  include StandardItemHelper

  layout "admin"

  before_action :authenticate_user!

  # Generic instance creation method.
  def create
    object = set_object
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
    object.destroy
    if object.destroyed?
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
    @result = instance_variable_get("@result")
    if @result == true
      flash[:notice] = "The
      #{nice_controller_name(controller_name)} was updated."
      redirect_to(controller: controller_name.to_s, action: "index")
    else
      render action: "edit"
    end
  end
end
