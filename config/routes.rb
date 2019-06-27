Rails.application.routes.draw do
  resources :equipments
  resources :dealers
  resources :items
  resources :services
  resources :billings
  resources :maintenances
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'acknowledgement', to: 'maintenances#acknowledgement'
  get 'followup', to: 'maintenances#followup'
  get 'survey', to: 'home#survey'
  get 'search', to: 'equipments#search'
  get 'download_pdf', to: "home#download_pdf"
  get 'about', to: "home#about"
  get 'staff', to: "home#staff"
  get 'dashboard', to: "home#dashboard"
  get 'equipments/:id/archive/', to: "equipments#archive", as: 'archive_equipment'
end
