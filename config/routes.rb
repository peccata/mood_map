MoodMap::Application.routes.draw do
  devise_for :users
  resources :users,  only: [:index, :show]
  resources :moods, only: [:create, :destroy]
  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
end
