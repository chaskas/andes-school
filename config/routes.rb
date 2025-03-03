School::Engine.routes.draw do
  resources :groups do
    post 'add_participant', on: :member
    delete :remove_participant, on: :member
  end
  resources :facilitators
  resources :participants
  resources :session_details
  root "participants#index"
end
