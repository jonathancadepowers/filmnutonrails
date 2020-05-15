# frozen_string_literal: true

module BlogPostsHelper
  def build_created_at_field(field, action_name)
    if action_name == "new"
      field.date_field :created_at,
                       required: true,
                       value: Time.zone.now.strftime("%Y-%m-%d")
    elsif action_name == "edit"
      field.date_field :created_at, required: true
    end
  end
end
