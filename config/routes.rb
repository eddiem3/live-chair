require "monban/constraints/signed_in"
require "monban/constraints/signed_out"
LiveChair::Application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end
  constraints Monban::Constraints::SignedOut.new do
    root "welcome#show"
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :appointments
  end
  
  resources :profiles, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resource :session, only: [:new, :create, :destroy]
      resources :users, only: [:index, :new, :create] do
        resources :appointments
        collection do
          get 'barbers'
        end
      end
      resources :profiles, only: [:index, :show, :new, :create] do
        resources :reviews, only: [:index, :new, :create, :show, :destory]
      end
    end
  end
end
