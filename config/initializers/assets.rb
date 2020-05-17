# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( layout_main.css )
Rails.application.config.assets.precompile += %w( layout_admin.css )

# For every controller in the application, add a line below.
# In the example "foo.css", replace "foo" with the controller's name.
# This ensure that each controller's dedicated stylesheet loads with each relevant view.  
# The Rails server must be restarted after the list below is modified.
Rails.application.config.assets.precompile += %w( blog_posts.css )
Rails.application.config.assets.precompile += %w( books.css )
Rails.application.config.assets.precompile += %w( comments.css )
Rails.application.config.assets.precompile += %w( films.css )
Rails.application.config.assets.precompile += %w( standard_item.css )
Rails.application.config.assets.precompile += %w( tv_shows.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( pages.css )
Rails.application.config.assets.precompile += %w( devise/sessions.css )
Rails.application.config.assets.precompile += %w( devise/registrations.css )
Rails.application.config.assets.precompile += %w( artifacts.css )
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf|otf)$/

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
