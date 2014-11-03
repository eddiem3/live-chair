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
  resources :users, only: [:new, :create]
  
  resources :profiles, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resource :session, only: [:new, :create, :destroy]
      resources :users, only: [:index, :new, :create] do
        collection do
          get 'barbers'
        end
      end
      resources :profiles, only: [:index, :show, :new, :create] do
        resources :reviews, only: [:index, :new, :create, :show, :destory]
      end
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
