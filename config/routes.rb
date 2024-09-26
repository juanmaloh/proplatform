Rails.application.routes.draw do
  get 'dashboards/index'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'forms#index', as: :authenticated_root
  end

  unauthenticated do
    root 'dashboards#index', as: :unauthenticated_root
  end

  resources :forms do
    resources :submissions, only: [:new, :create] # Rutas anidadas para submissions
  end
end
