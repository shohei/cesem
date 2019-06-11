Rails.application.routes.draw do
  resources :dealers
  resources :items
  resources :services
  resources :billings
  resources :maintenances
  devise_for :users
  get 'home/index'
  root 'home#index'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
