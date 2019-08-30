# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # TODO: Implement Abhi's feedback to move this into a stand-alone module in lib.
  # Creates a polymorphic object that basic CRUD methods can leverage.
  def set_object
    @object = instance_variable_get("@#{controller_name.singularize}")
  end

  # Generic instance creation method.
  def create
    set_object
    if @object.save == true
      flash[:notice] = "New #{controller_name.singularize.sub('_', ' ').titleize} added."
      redirect_to(controller: controller_name.to_s, action: "index")
    else
      render action: "new"
    end
  end

  # Generic instance destruction method.
  def destroy
    set_object
    @object.destroy
    if @object.destroyed? == true
      flash[:notice] = "The
        #{controller_name.singularize.sub('_', ' ').titleize} was deleted!"
    else
      flash[:error] = "An error occured while
        attempting to delete a #{controller_name.singularize.sub('_', ' ').titleize}."
    end
    redirect_to(controller: controller_name.to_s, action: "index")
  end

  # Generic instance update method.
  def update
    set_object
    @result = instance_variable_get("@result")
    if @result == true
      flash[:notice] = "The
      #{controller_name.singularize.sub('_', ' ').titleize} was updated."
      redirect_to(controller: controller_name.to_s, action: "index")
    else
      render action: "edit"
    end
  end
end
