Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  get 'time_sets/index'

  get 'affairs/index'

  get 'categories/index'

  get 'users/index'

  controller :session_admin do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :affairs, only: [:index, :new, :create]
  resources :categories, only: [:index, :new, :create]
  resources :time_sets, only: [:index, :new, :create] do
    collection do
      post 'select_category'
    end
  end
  resources :users, only: [:index, :new, :create, :update, :edit, :destroy]

  match '/select_category' => 'time_sets#select_category', via: 'post'

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
