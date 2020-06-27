require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Filmnut
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.eager_load_paths << Rails.root.join("lib")
    config.eager_load = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.enabled = true
    config.active_storage.service_urls_expire_in = 999.years
    RSpotify.authenticate("59966b30b87943ce99dd736880815410", "b06aab6c2a7f489f8aa256a149791f18")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
