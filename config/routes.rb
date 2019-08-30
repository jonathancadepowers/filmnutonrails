Rails.application.routes.draw do
  
  root "blog_posts#index"
  get "/films/tmdb_search" => "films#tmdb_search"
  get "/films/tmdb_get_film_attributes" => "films#tmdb_get_film_attributes"
  resources :films, :tv_shows
  resources :blog_posts do
    resources :comments
  end  
end
