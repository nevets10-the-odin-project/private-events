Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :events, :users
  resources :attended_events, only: %i[create destroy]
  root 'events#index'
end
