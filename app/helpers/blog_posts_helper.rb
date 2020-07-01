# frozen_string_literal: true

module BlogPostsHelper
  def post_date_in_local_zone(created_at)
    created_at.in_time_zone(app_time_zone_as_zone).strftime("Posted %B %e, %Y")
  end
end
