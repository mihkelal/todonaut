# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :notes, action: :index

  get 'hello_world/index'

  get 'register', controller: :users, action: :new
  post 'register', controller: :users, action: :create

  resources :notes, except: %i[destroy] do
    member do
      patch :complete
    end
  end
end
