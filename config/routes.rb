Rails.application.routes.draw do
  resources :equipments
  resources :dealers
  resources :items
  resources :services
  resources :billings
  resources :maintenances
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'home/index'
  root 'home#index'
  get 'acknowledgement', to: 'maintenances#acknowledgement'
  get 'followup', to: 'maintenances#followup'
  get 'survey', to: 'home#survey'
  get 'service', to: 'home#service', as: 'all_service'
  get 'search', to: 'equipments#search'
  get 'download_pdf', to: "home#download_pdf"
  get 'about', to: "home#about"
  get 'staff', to: "home#staff"
  get 'dashboard', to: "home#dashboard"
  put 'maintenance_cancel_request/:id', to: "maintenances#cancel_request", as: 'maintenance_cancel_request'
  get 'cancel_request_received/:id', to: 'maintenances#cancel_request_received', as: 'cancel_request_received'
  get 'equipments/:id/archive/', to: "equipments#archive", as: 'archive_equipment'
  get 'equipments/:id/unarchive/', to: "equipments#unarchive", as: 'unarchive_equipment'
  get 'sign_up_confirmation', to: 'home#sign_up_confirmation', as: 'sign_up_confirmation'
end
