# frozen_string_literal: true

class LifeLogsController < ApplicationController
  before_action :hydrate_sidebar_data, only: %i[all day]

  def all
    @life_logs_set_grouped_by_month_then_day = LifeLog.life_logs_set(100)
    render layout: "main"
  end

  def day
    @life_logs_set_grouped_by_month_then_day =
      LifeLog.life_logs_set_single_day(params[:day])
    render layout: "main"
  end
end
