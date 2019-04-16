Rails.application.routes.draw do

  scope "(:locale)", locale: /en|fr/ do
    devise_for :users, :controllers => { registrations: 'users/registrations' }
    root to: 'home#index'
    resources :announcements
    # get 'announcements', to: 'announcements#index'
    # get 'announcements/new', to: 'announcements#new'
    # get 'announcements/create', to: 'announcements#new'
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

  # namespace :api, format: 'json' do
  #   namespace :v1 do
  #     post 'auth', to: 'auth#create'
  #     get 'users', to: 'users#show'
  #   end
  # end

end