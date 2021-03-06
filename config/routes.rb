Rails.application.routes.draw do
  
  get 'spotify/spotify'
  root "blog_posts#all"
  match "/admin" => "films#index", :as => :admin, via: [:get]  
  get "artifacts/create"
  get "artifacts/destroy"
  get "artifacts/edit"
  get "artifacts/index"
  get "artifacts/new"
  get "artifacts/update"
  get "artifacts/clipboard_copy" => "artifacts#clipboard_copy"  
  get "/blog_posts/archives" => "blog_posts#archives"
  match "blog_posts/year/:year" => "blog_posts#year", :as => :year, via: [:get]
  match "blog_posts/tag/:tag" => "blog_posts#tag", :as => :tag, via: [:get]
  devise_for :users
  get "/pages/:page" => "pages#show"
  post "/films/tmdb_search" => "films#tmdb_search"
  get "/films/tmdb_get_film_attributes" => "films#tmdb_get_film_attributes"  
  get "/podcasts/podcast_lookup" => "podcasts#podcast_lookup"  
  get "/tv_shows/tv_show_lookup" => "tv_shows#tv_show_lookup"
  get "/books/all" => "books#all"
  get '/auth/spotify/callback', to: 'spotify#callback'
  get "/runs/all" => "runs#all"
  get "/fasts/all" => "fasts#all"
  get "/blog_posts/all" => "blog_posts#all"  
  get "/podcast_episodes/all" => "podcast_episodes#all"
  get "life_logs/all"
  match "life_logs/:day" => "life_logs#day", :as => :life_log_day, via: [:get]
  get "/films/all" => "films#all"
  get "/tv_show_seasons/all" => "tv_show_seasons#all"
  patch "/users/handle_admin_approval" => "users#handle_admin_approval"
  resources :films, :tv_shows, :tv_show_seasons, :books, :users, :artifacts, :runs, :podcast_episodes, :podcasts, :fasts
  resources :blog_posts do
    resources :comments
  end
end
