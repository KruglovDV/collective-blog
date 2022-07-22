# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: %w[new create]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
