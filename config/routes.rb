Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'home#index'
  get 'accounts/profile', to: 'account#profile'
  get 'accounts/index', to: 'account#index'
  get 'accounts/contacts', to: 'account#contacts'
  namespace :account do
    resources :contacts
    resources :messages
    resources :profile do
      collection do
      patch 'update_user', to: :update_user
      patch 'update_password', to: :update_password
      end
    end
  end
end