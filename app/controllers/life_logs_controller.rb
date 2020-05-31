# frozen_string_literal: true

class LifeLogsController < ApplicationController
  before_action :hydrate_sidebar_data, only: %i[all show day]

  def all
    @life_logs_set_grouped_by_day = LifeLog.life_logs_set(100)
    render layout: "main"
  end

  def show
    # Stores the single life log object as an array
    # in order to render the same partial for both the
    # #show and #all actions in each of their respectives views.
    @single_log_log_as_array = []
    @single_log_log_as_array << LifeLog.find(params[:life_log_date])
    render layout: "main"
  end

  def day
    @life_logs_set_grouped_by_day =
      LifeLog.life_logs_set_single_day(params[:day])
    render layout: "main"
  end
end
