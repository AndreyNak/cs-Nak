# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :admin do
    resources :maps
    resources :lessons
  end

  scope module: :servers, path: '/servers' do
    resources :modes, param: 'slug', path: '', only: %i[show] do
      get '/:id/', as: 'server', controller: '/servers', action: 'show'
    end
  end

  resources :profiles, only: %i[show edit update] do
    get 'find_friens', to: 'profiles#index'
    post 'friendship', on: :member

    resources :friends, controller: 'profiles/friends', only: %i[index destroy]
    resources :friend_requests, controller: 'profiles/friend_requests', only: %i[index update destroy show]
  end
  resources :lessons, only: %i[index show]

  get '/home', to: 'home#index'
  root to: 'home#index'
end
