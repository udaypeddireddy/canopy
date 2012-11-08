Canopyportal::Application.routes.draw do
  

resources :home
  resources :placement_fulfilments

resources :payfortimesheets


resources :userrequests  do 
resources :users
end

 resources :vendors do
  resources :clients
resources :vendor_contacts
end

resources :clients do
resources :projects
end
    
    
    resources :users do
        resources :timesheets
          resources :personal_profiles # , :as=>"profiles"
          resources :organizationprofile  #, :as => "organizationprofiles" 
          resources :status_reports
          resources :user_requests
    end
    
 resources :status_reports   
resources :timesheets do 
resources  :users
resources :timesheet_days
end
    
 
    
resources :recruitmentmetrics do
  resources :users
end


resources :sessions

resources :self_services
resources :projects do
  resources :users
end
resources :clients
resources :user_requests

root :to=>'home#index'

get "summary"=>'home#show', :as=>"summary"

get "log_out" =>'sessions#destroy', :as=>"log_out"

match 'changepwd' =>'personal_profiles#changepwd'
match 'changepassword'=>'personal_profiles#changepassword'


match 'update_multiple'=>'timesheets#update_multiple'

match  'update_requests'=>'user_requests#update_requests'

match 'download'=>'self_services#download'

match 'list'=>'status_reports#list'

match 'assignproject'=>'projects#assignproject'
match 'newconsultant'=>"users#newconsultant"
match 'new_sales_person'=>"users#new_sales_person"
match 'download_timesheet'=>'timesheets#download_timesheet'  # The priority is based upon order of creation:
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
  # match ':controller(/:action(/:id))(.:format)'
end
