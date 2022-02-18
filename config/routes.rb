Rails.application.routes.draw do
  root 'lists#index'

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
end
