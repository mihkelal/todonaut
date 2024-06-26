# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root controller: :notes, action: :index

  resource :register, only: %i[create], controller: :users do
    get :new
  end
  resource :login, only: %i[create], controller: :sessions do
    get :new
  end
  resource :locale, only: %i[update]
  resource :logout, only: %i[destroy], controller: :sessions

  resources :notes, except: %i[destroy] do
    member do
      patch :complete
    end
  end
end
