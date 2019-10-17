# frozen_string_literal: true

module DeviseHelper
  def pw_length_alert(minimum_password_length)
    minimum_password_length.to_s + "+ characters required." if minimum_password_length
  end

  def log_in_out_link(current_user)
    if current_user
      link_to("Log Out",
              destroy_user_session_path,
              method: :delete,
              class: "dropdown-item")
    else
      link_to("Log In",
              new_user_session_path,
              class: "dropdown-item")
    end
  end

  def edit_user_link(current_user)
    if current_user
      link_to("Edit Profile",
              edit_user_registration_path,
              class: "dropdown-item")
    end
  end
end
