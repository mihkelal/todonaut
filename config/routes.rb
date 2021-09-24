# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :notes, action: :index

  get 'hello_world/index'

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
