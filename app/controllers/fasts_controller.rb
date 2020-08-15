# frozen_string_literal: true

class FastsController < StandardItemController
  skip_before_action :authenticate_user!, only: [:all]
  before_action :hydrate_sidebar_data, only: %i[all]

  def all
    @all_fasts = Fast.all.order("created_at DESC")
    render layout: "main"
  end

  def create
    @display_timestamp = fast_params[:created_at]
    new_params = build_new_params
    @fast = Fast.new(new_params)
    super
  end

  def destroy
    @fast = Fast.find(params[:id])
    super
  end

  def edit
    @fast = Fast.find(params[:id])
  end

  def index
    @all_fasts = Fast.all.order("updated_at DESC")
  end

  def new
    @fast = Fast.new
  end

  def update
    @object = Fast.find(params[:id])
    @display_timestamp = fast_params[:created_at]
    new_params = build_new_params
    @object_result = @object.update(new_params)
    super
  end

  private

  def fast_params
    params.require(:fast).permit(
      :time_fasted,
      :created_at
    )
  end

  def build_new_params
    new_params = fast_params
    new_params[:time_fasted] = ChronicDuration.parse(fast_params[:time_fasted])
    new_params[:title] = helpers.title_fast(@display_timestamp,
                                            new_params[:time_fasted])
    new_params
  end
end
