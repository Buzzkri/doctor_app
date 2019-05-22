Rails.application.routes.draw do
root "patients#index"

resources :doctors
  resources :patients do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
