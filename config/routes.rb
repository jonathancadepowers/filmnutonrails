Rails.application.routes.draw do
  
  get 'artifacts/create'
  get 'artifacts/destroy'
  get 'artifacts/edit'
  get 'artifacts/index'
  get 'artifacts/new'
  get 'artifacts/update'
  get 'artifacts/clipboard_copy' => "artifacts#clipboard_copy"
  root "blog_posts#all"
  # devise_for :users
  get "/pages/:page" => "pages#show"
  post "/films/tmdb_search" => "films#tmdb_search"
  get "/films/tmdb_get_film_attributes" => "films#tmdb_get_film_attributes"
  get "/blog_posts/all" => "blog_posts#all"
  get "/films/all" => "films#all"
  get "/tv_shows/all" => "tv_shows#all"
  get "/books/all" => "books#all"
  patch "/users/handle_admin_approval" => "users#handle_admin_approval"
  resources :films, :tv_shows, :books, :users, :artifacts
  resources :blog_posts do
    resources :comments
  end
end
