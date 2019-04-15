Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'home#index'
  get 'accounts/profile', to: 'account#profile'
  get 'accounts/messages', to: 'account#messages'
  get 'accounts/contacts', to: 'account#contacts'
  patch 'accounts/update_password', to: 'account#update_password'
  patch 'accounts/update_user', to: 'account#update_user'
end