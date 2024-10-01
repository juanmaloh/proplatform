Rails.application.routes.draw do
  get 'questions/index'
  get 'dashboards/index'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'forms#index', as: :authenticated_root
  end

  unauthenticated do
    root 'dashboards#index', as: :unauthenticated_root
  end

  resources :forms do
    resources :submissions, only: [:new, :create, :show] # Rutas para los envíos de los formularios
  end

  resources :categories do
    resources :questions, only: [:index] # Las preguntas se relacionan con su categoría correspondiente
  end
end
