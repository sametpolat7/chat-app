Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :chat_rooms, only: [:index, :show]
    end
  end

  devise_for :users

  resources :chat_rooms, only: [:index, :new, :create, :show] do
    resources :messages, only: [:create]
  end

  resource :user, only: [:show, :edit, :update]

  root "chat_rooms#index"
end
