School::Engine.routes.draw do

  resources :participants

  root "participants#index"
end
