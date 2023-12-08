Rails.application.routes.draw do
root 'items#new'
  resources :items do
    member do
      put 'soft_delete', to: 'items#soft_delete'
      put 'restore', to: 'items#restore'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'restore_items', to: 'items#restore', as: :restore_items
  put 'restore_items', to: 'items#restore_items'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
