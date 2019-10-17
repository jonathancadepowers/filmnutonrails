Rails.application.routes.draw do
  
  root "films#index"
  devise_for :users
  post "/films/tmdb_search" => "films#tmdb_search"
  get "/films/tmdb_get_film_attributes" => "films#tmdb_get_film_attributes"
  patch "/users/handle_admin_approval" => "users#handle_admin_approval"
  resources :films, :tv_shows, :books, :users
  resources :blog_posts do
    resources :comments
  end  
end
