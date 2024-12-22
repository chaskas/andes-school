School::Engine.routes.draw do
  resources :groups
  resources :facilitators

  resources :participants

  root "participants#index"
end
