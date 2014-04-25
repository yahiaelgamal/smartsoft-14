HealthyGrocery::Application.routes.draw do
  
  resources :healthrecords


  # (GUI Team) This is added to be able to redirect to the hub.html.erb in members

 get 'members/hub'
 resources :healthrecords
resources :health_records
  
 resources :items do
  member do
   post 'toggle_pause'
  end
 end
  # Author: Hazem Amin
  # Component: 5
  # A HTTP post request is made (when the item is called, i.e. when the button_to is clicked)
  # it's invoked on a single item (member)

  resources :wishlines

  resources :drivers
  # Author: Hazem Amin 
  # Component: 5
  # Drivers page

   resources :wishlists

  resources :wishlines
get "/members/:id/get_records" , :to =>"members#get_records" , as: "indexhealthrecord"

   root :to => 'members#index' # so as to not for the member to root to the page containnng site members!!

 devise_for :members, :controllers => {:registrations => "registrations", }

  
 resources :lineitems



 resources :carts


 root :to => "members#index"
 devise_for :members, :controllers => {:registrations => "registrations", }

 resources :members

 
   #for user profile page
   resources :members do
   get 'edit'
   
 end

  resources :members  
 # get "get_records"
  resources :members do
   member do 
    post :order_checkboxes
    end 
  end
  match 'user_root' => redirect("/member/show")
  resources :members
  resources :items do
  collection do
  get "members_items_index"
  post "add"
  end
  end
  match '/items' => 'items#index'

  resources :routes


  resources :shipments


  resources :trucks


  resources :orders


  resources :users


    
  
  match '/generateroutes' => 'generateroutes#index'
  post "generateroutes/shipmentupdate" => "generateroutes#shipmentupdate" 
  post "generateroutes/gen" => "generateroutes#gen" 
  post "items/members_items_index/add" => "items#add"
  
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
