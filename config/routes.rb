MyAssignment::Application.routes.draw do
  get "sessions/new"

  get "session/new"

  resources :book_categories


  get "store/index"

  controller :sessions do
    get "login" => :new
    post "login" => :create
    post "logout" => :destroy
  end


  resources :carts


  resources :order_lines


  resources :orders


  resources :comments


  resources :categories


  resources :users
  #get 'users/password/new', :to => "my_devise/passwords#new"
  # devise_for :users
  devise_for :users, :controllers => {:passwords => "my_devise/my_passwords" }
  

  get "category/:category", :to => "store#index", :as => 'category_filter'
  post "order_lines/book/:book_id", :to => "order_lines#create", :as => 'add_to_cart'
  match "store/index?page=:id", :to => 'store#index', :as => 'store'
  resources :books

  root to: 'store#index', as: 'store' 


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
