Rails.application.routes.draw do

  resources :schedule_dates do
    member do
      get :schedule
    end
  end

  resources :enterprises

  resources :regions

  devise_for :users
  scope "/admin" do
    resources :users
  end


  as :user do
    get "/login" => "devise/sessions#new"
  end

  as :user do
    post "/login" => "devise/sessions#create"
  end

  resources :programs

  resources :roles

  resources :provinces

  get 'faq'    => 'static_pages#faq'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get '/programs/:id/details', :to => 'programs#details', :as => :program_details
  #get 'users'  => 'users#index'
  #get '/users/:id', :to => 'users#show', :as => :user
  #get '/users/:id/edit'  => 'users#edit', as: 'edit_user'
  #patch "users/:id" => "users#update"

  get 'new_user'  => 'devise/registrations#new'
  
  #authenticated :user do
  #  root :to => 'programs#index', as: :authenticated_root
  #end
  root :to => 'static_pages#home'

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
