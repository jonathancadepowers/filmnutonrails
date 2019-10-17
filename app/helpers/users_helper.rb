# frozen_string_literal: true

module UsersHelper
  def handle_user_approved_checkbox(user_id)
    "checked" if User.find(user_id).approved
  end
end
