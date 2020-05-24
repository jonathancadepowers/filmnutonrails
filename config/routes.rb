Rails.application.routes.draw do
  
  root "blog_posts#all"
  get 'artifacts/create'
  get 'artifacts/destroy'
  get 'artifacts/edit'
  get 'artifacts/index'
  get 'artifacts/new'
  get 'artifacts/update'
  get 'artifacts/clipboard_copy' => "artifacts#clipboard_copy"  
  get "/blog_posts/archives" => "blog_posts#archives"
  match "blog_posts/year/:year" => "blog_posts#year", :as => :year, via: [:get]
  match "blog_posts/tag/:tag" => "blog_posts#tag", :as => :tag, via: [:get]
  devise_for :users
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
