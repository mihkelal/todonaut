Rails.application.routes.draw do
  root controller: :notes, action: :index

  get 'hello_world/index'

  resources :notes do
    member do
      patch :complete
    end
  end
end
