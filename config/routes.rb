Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'welcome/index'

  root 'issuers#index'

  resources :issuers

  resources :security_types

  resources :interest_frequencies
  resources :securities

  resources :uploads

  namespace :api do
    namespace :v1 do
      resources :csv_uploads
    end
  end

  get 'api/v1/csv_uploads/export_csv/:id' , to: 'api/v1/csv_uploads#export_csv'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
