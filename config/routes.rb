Rails.application.routes.draw do
  root 'blog_posts#index'
  resources :films
  resources :blog_posts do
    resources :comments
  end
end
