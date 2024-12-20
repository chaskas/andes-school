School::Engine.routes.draw do
  resources :facilitators

  resources :participants

  root "participants#index"
end
