Rails.application.routes.draw do
  devise_for :teams

  resources :posts, only: [:create, :index, :new, :show]
  resources :comments, only: :create
  resources :teams, only: [:index, :show]
  get 'comments' => redirect('posts')
  root 'teams#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
