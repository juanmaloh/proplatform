Rails.application.routes.draw do
  get 'dashboards/index'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'forms#index', as: :authenticated_root # Ruta cuando el usuario está autenticado
  end

  unauthenticated do
    root 'dashboards#index', as: :unauthenticated_root # Ruta cuando el usuario no está autenticado
  end

  resources :forms, only: [:index, :new, :create, :show] # Agregar la acción show
end



