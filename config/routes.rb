# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :maps
  end

  scope module: :servers, path: '/servers' do
    resources :modes, param: 'slug', path: '', only: %i[show] do
      get '/:id/', as: 'server', controller: '/servers', action: 'show'
    end
  end

  # get '/*path' => 'home#index'
  get '/home', to: 'home#index'
  root to: 'home#index'
end
