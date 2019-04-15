Rails.application.routes.draw do
  scope "(:locale)", locale: /en|fr/ do
    devise_for :users, :controllers => { registrations: 'users/registrations' }
    root to: 'home#index'
  end
end