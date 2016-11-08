Rails.application.routes.draw do
  get   'venues/index'
  get  'venues/new' => 'venues#new'
  post 'venues/create' => 'venues#create'
  

  get '/events/:event_id/tickets/create_type' => 'tickets#create_type'
  get "xuat_hien/:id" => 'events#xuat_hien' ,:as => 'xuat_hien'
  get "created_by_user/:id" => 'events#created_by_user' ,:as => 'created_by_user'
  get 'events/new' => 'events#new' 
  get 'events/:id/edit' => 'events#edit'
  post 'events' => 'events#create'
  root 'events#index'

 
   #get 'events/:id' => 'events#show'
  
  
 
  

  resources :events do
    resources :tickets do
      get   :create_type, on: :collection
      post  :create_type, on: :collection
  end
  end
  root "users#index"
  get '/users/new' => 'users#new'
  resources :users
  resources :sessions, only: [:new, :create]
  
  delete '/logout' => 'sessions#destroy'

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
