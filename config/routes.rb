Rails.application.routes.draw do


  get 'profiles/show'

  devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :wikis do
    # resources :collaborations, only: [:index]
    resources :collaborations, only: [:index, :create]
  end

  resources :wikis do
    patch 'privatize', on: :member
  end

  # TODO - try this latera
  # Xander also suggested (doesn't work)
  # put 'wikis/:id/privatize', to "Wiki#privatize"

  resources :profiles, only: [:show]

  root 'welcome#index'

  resources :charges, only: [:new, :create]


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
