Rails.application.routes.draw do
  devise_for :users
  resources :patients

  root 'patients#index'

  get "up" => "rails/health#show", as: :rails_health_check

  resource :stats , only: [:show]

end
