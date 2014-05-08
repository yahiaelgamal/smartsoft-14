HealthyGrocery::Application.routes.draw do
  
  resources :healthrecords


  # (GUI Team) This is added to be able to redirect to the hub.html.erb in members

 get 'members/hub'
 
resources :health_records
  
 resources :items do
   collection do
  get "members_items_index"
  post "add"
  end
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

get "/members/:id/get_records" , :to =>"members#get_records" , as: "indexhealthrecord"

 root :to => 'members#index' # so as to not for the member to root to the page containnng site members!!

 devise_for :members, :controllers => {:registrations => "registrations", }


  
 resources :lineitems



 resources :carts


 root :to => "members#index"
 devise_for :members, :controllers => {:registrations => "registrations", }

   #for user profile page
   resources :members do
   get 'edit'
   
   #Author: Ahmed Helali
   #Team 2
   # I added this path for the show_restricted_items
   #controller and view
   
   get :show_restricted_items, :on => :collection
   get :show_ideal_calories, :on => :collection
   get :calculated_ideal, :on => :collection
   
 end


 
 # get "get_records"

  match 'user_root' => redirect("/member/show")

  


 

  

#Author:FatmaEmran
#T2
#Link to the health records of the people whom the user chose to order for
   
 #get "get_records"
  resources :members do
   member do 
    post :order_checkboxes
    end 
  end
  match 'user_root' => redirect("/member/show")
 
  
  

  match '/items' => 'items#index'
  #Author : Amr Nabil
  #Team 3 
  #path for editing the price of an item  
  get '/items/:id/editprice', to: 'items#editprice', as: 'editprice'
  #Author : Amr Nabil
  #Team : 3
  #in order to update the price of an item
  put 'items/:id/updateprice', to:'items#updateprice', as: 'updateprice'

  resources :routes


  resources :shipments


  resources :trucks 


  resources :orders


  resources :users


    
  
  match '/generateroutes' => 'generateroutes#index'
  post "generateroutes/shipmentupdate" => "generateroutes#shipmentupdate" 
  post "generateroutes/gen" => "generateroutes#gen" 


  resources :diseases

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
