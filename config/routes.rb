Rails.application.routes.draw do
  root to: 'hello_world#index'

  get 'hello_world/index'

  resources :notes
end
