Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", omniauth_callbacks: "users/omniauth_callbacks"}, :skip => :registerable
  root to: "welcome#index"

  resources :rooms, only: [:show, :create]
  resources :messages, only: [:create]
  resources :global_rooms, except: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
