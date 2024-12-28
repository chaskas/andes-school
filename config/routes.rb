School::Engine.routes.draw do
  resources :groups do
    # Ruta personalizada para agregar un participante al grupo
    post 'add_participant', on: :member
  end
  resources :facilitators

  resources :participants

  root "participants#index"
end
