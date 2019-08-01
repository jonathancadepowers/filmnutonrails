Rails.application.routes.draw do
  get 'about/index'
  root 'films#index'
  resources :films
end
