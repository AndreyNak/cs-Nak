# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/home')

  # get '/*path' => 'home#index'
  get '/home', to: 'home#index'


  scope module: :servers, path: '/servers' do
    # get '/:slug/', to: 'modes#show'
    resources :modes,  path: '', only: %i[show]
  end
end
