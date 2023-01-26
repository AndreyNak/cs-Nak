# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  namespace :admin do
    resources :maps
    resources :lessons
  end

  scope module: :servers, path: '/servers' do
    resources :modes, param: 'slug', path: '', only: %i[show] do
      get '/:id/', as: 'server', controller: '/servers', action: 'show'
    end
  end

  resources :lessons, only: %i[index show]

  # get '/*path' => 'home#index'
  get '/home', to: 'home#index'
  root to: 'home#index'
end
