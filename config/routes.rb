Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/attorney_portal', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :pages, only: [:index]
  match "/*page_name", to: 'pages#show', page_name: /(?!attorney_portal)[a-zA-Z]+/, via: [:get]
  root 'pages#index'
end
