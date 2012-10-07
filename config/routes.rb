Bats::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  
  resources :bookings

  resources :newsletters do
    member do
      post 'deliver' 
    end
  end

  resources :posts do
    resources :comments
  end

  # resources :users
  resources :users
  match 'signup' => 'users#new', :as => :signup
  
  resources :day_trips do
    resources :destinations
  end

  resources :albums do
    resources :photos
  end

  resources :beaches do
    resources :destinations
  end

  resources :treks do
    resources :destinations
  end

  resources :safaris do
    resources :destinations
  end

  # resources :destinations
  
  # resources :users
  match 'signup' => 'users#new', :as => :signup
  
  resources :sessions
  match 'login'  => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  
  resources :home
  resources :pages, except: :show
  
  get ':id', to: 'pages#show', as: :page
  put ':id', to: 'pages#update', as: :page
  delete ':id', to: 'pages#destroy', as: :page 

  # %w[ about_us accommodation about_tanzania booking contact_us guides_and_porters kit_hire itineraries important_information terms_and_conditions faq ].each do |page|
  #   get page, controller: :pages, action: page
  # end


  
  
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
