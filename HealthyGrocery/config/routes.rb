HealthyGrocery::Application.routes.draw do
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR MEMBER
#----------------------------------------------------------------------------------------------------#
  #for user profile page
  get 'members/hub'
  get 'members/generate_routes'

  get "/members/:id/get_records" , :to =>"members#get_records" , as: "indexhealthrecord"
  root :to => 'members#index' # so as to not for the member to root to the page containnng site members!!
  devise_for :members, :controllers => {:registrations => "registrations", }
  match 'user_root' => redirect("/member/show")
   resources :members do
   get 'edit'
   #Author: Ahmed Helali
   #Team 2
   # I added this path for the show_restricted_items
   #controller and view
   get :show_restricted_items, :on => :collection
   get :show_ideal_calories, :on => :collection
   get :calculated_ideal, :on => :collection
   #Author:FatmaEmran
   #T2
   #Link to the health records of the people whom the user chose to order for
    member do 
    post :order_checkboxes
    end 
 end
  # (GUI Team) This is added to be able to redirect to the hub.html.erb in members
    # get "get_records"

 


#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR ITEMS
#----------------------------------------------------------------------------------------------------#
 post "items/members_items_index/add" => "items#add"
 resources :items do
   collection do
  get "members_items_index"
  post "add"
  end
  member do
   post 'toggle_pause'
  end
 end
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR HEALTHRECORDS
#----------------------------------------------------------------------------------------------------#
  resources :healthrecords
  resources :health_records
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR WISHLINES
#----------------------------------------------------------------------------------------------------#
 resources :wishlines
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR DRIVERS
#----------------------------------------------------------------------------------------------------#
  resources :drivers
  # Author: Hazem Amin 
  # Component: 5
  # Drivers page
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR WISHLISTS
#----------------------------------------------------------------------------------------------------#
 resources :wishlists
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR LINEITEMS
#----------------------------------------------------------------------------------------------------#
  resources :lineitems
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR CARTS
#----------------------------------------------------------------------------------------------------#
  resources :carts
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR ROUTES
#----------------------------------------------------------------------------------------------------#
 resources :routes
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR SHIPMENTS
#----------------------------------------------------------------------------------------------------#
  resources :shipments
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR TRUCKS
#----------------------------------------------------------------------------------------------------#
  resources :trucks
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR ORDERS
#----------------------------------------------------------------------------------------------------#
 # Author: Mahmoud Walid
 # Team: 3
 # Function: adding routes for chaning pass and pass_billing attributes for updating shipping
 # and billing addresses
  get   '/orders/:id/choose', to:'orders#choose' , as: 'chooseOrder'
  put '/orders/:id/submit' , to: 'orders#submit' , as: 'submit'
  get '/orders/:id/change' , to: 'orders#change' , as: 'change'
  match "/addresses/:id/position", :to => "addresses#position", as: 'addressesposition'
  get "addresses/position"
  resources :orders
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR USERS
#----------------------------------------------------------------------------------------------------#
  resources :users
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR DISEASES
#----------------------------------------------------------------------------------------------------#
 resources :diseases
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR GENERATEROUTES
#----------------------------------------------------------------------------------------------------#

#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR HEALTH_RECORDS
#----------------------------------------------------------------------------------------------------#
  resources :health_records
#----------------------------------------------------------------------------------------------------#
      #ROUTES FOR ADDRESSES
#----------------------------------------------------------------------------------------------------#
  resources :addresses
  # Author: Mahmoud Walid
  # Team: 3
  # Function: adding routes for showing orders and addresses of the member
  get '/member/showOrders', to: 'members#showOrders', as: 'showOrders'
  get '/member/show_addresses', to: 'members#show_addresses', as: 'showaddresses'
#----------------------------------------------------------------------------------------------------#
      #NOTHING GOES BELOW THIS
#----------------------------------------------------------------------------------------------------#
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
