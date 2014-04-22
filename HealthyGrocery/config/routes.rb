HealthyGrocery::Application.routes.draw do
  
  # (GUI Team) This is added to be able to redirect to the hub.html.erb in members
 get 'members/hub'
  resources :health_records
  resources :wishlines
 root :to => 'members#index' # so as to not for the member to root to the page containnng site members!!
 devise_for :members, :controllers => {:registrations => "registrations", }
  resources :addresses

    get '/member/showOrders', to: 'members#showOrders', as: 'showOrders'
  get '/member/show_addresses', to: 'members#show_addresses', as: 'showaddresses'
 

  resources :items do
  collection do
  get "members_items_index"
  end
  end

  match '/items' => 'items#index'
  resources :routes
  resources :shipments
  resources :trucks



  get   '/orders/:id/choose', to:'orders#choose' , as: 'chooseOrder'
  put '/orders/:id/submit' , to: 'orders#submit' , as: 'submit'
  get '/orders/:id/change' , to: 'orders#change' , as: 'change'

  resources :orders
 



  resources :users
  

  match '/generateroutes' => 'generateroutes#index'
  post "generateroutes/shipmentupdate" => "generateroutes#shipmentupdate" 
  post "generateroutes/gen" => "generateroutes#gen" 

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
