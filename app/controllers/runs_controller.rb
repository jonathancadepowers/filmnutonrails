# frozen_string_literal: true

class RunsController < StandardItemController
  skip_before_action :authenticate_user!, only: [:all]
  before_action :hydrate_sidebar_data, only: %i[all]

  def all
    @all_runs = Run.all.order("created_at DESC")
    render layout: "main"
  end

  def create
    @display_timestamp = run_params[:created_at]
    new_params = build_new_params
    @run = Run.new(new_params)    
    super
  end

  def destroy
    @run = Run.find(params[:id])
    super
  end

  def edit
    @run = Run.find(params[:id])
  end

  def index
    @all_runs = Run.all.order("updated_at DESC")
  end

  def new
    @run = Run.new
  end

  def update
    @object = Run.find(params[:id])
    @display_timestamp = run_params[:created_at]
    new_params = build_new_params
    @object_result = @object.update(new_params)
    super
  end

  private

  def run_params
    params.require(:run).permit(
      :miles,
      :run_time,
      :location,
      :created_at
    )
  end

  def build_new_params
    new_params = run_params
    new_params[:miles] = run_params[:miles].to_f
    new_params[:run_time] = ChronicDuration.parse(run_params[:run_time])
    new_params[:title] = helpers.title_run(@display_timestamp,
                                           new_params[:miles],
                                           new_params[:run_time])
    new_params
  end
end
