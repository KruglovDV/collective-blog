# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: %w[new create show] do
    resources :comments, only: %w[create]
    resources :likes, only: %w[create destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
