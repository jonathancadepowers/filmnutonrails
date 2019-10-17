# frozen_string_literal: true

class UsersController < StandardItemController
  def handle_admin_approval
    user = User.find(params[:id])
    user.approved = user.approved ? false : true
    result = user.save
    data = {}
    data[:result] = result
    data[:user_id] = user.id
    data[:checked_state] = user.approved ? true : false
    render json: data
  end

  def index
    @all_users = User.all
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :is_approved
    )
  end
end
