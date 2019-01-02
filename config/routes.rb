Rails.application.routes.draw do
  root controller: :notes, action: :index

  get 'hello_world/index'

  resources :notes, except: %i[destroy] do
    member do
      patch :complete
    end
  end
end
