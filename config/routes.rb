Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root "home#index"
  resources :referrals, only: [:index, :new, :create]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do 
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
    end
  end
end
