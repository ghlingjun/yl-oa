YunlingOA::Application.routes.draw do

  resources :work_logs

  resources :communicate_messages

  resources :prompt_messages

  resources :application_receivers

  resources :leave_applications

  resources :business_trip_applications

  resources :item_applications

  resources :expense_applications

  resources :payment_applications

  resources :contract_applications

  resources :billing_applications

  resources :notices

  resources :users

  resources :roles
  
  resources :use_car_registrations

  resource  :session

  match '/signup' => 'users#new', :as => 'signup'
  match '/settings' => 'users#settings', :as => 'settings'
  match '/login' => 'sessions#new', :as => 'login'
  match '/logout' => 'sessions#destroy', :as => 'logout'

  match 'application/:id/download/'  => 'application#download', :as => 'download_application'

  namespace :admin do
    resources :leave_applications
    resources :work_logs
    resources :business_trip_applications
    resources :use_car_registrations
    match 'statistics'      => 'work_logs#statistics',     :as => :statistics
  end

  namespace :finance do
    resources :expense_applications
    resources :payment_applications
    resources :contract_applications
    resources :billing_applications
  end

  namespace :sale do
    resources :contract_applications
    resources :billing_applications
  end

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
  # root :to => "welcome#index"
  root :to=>'notices#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
