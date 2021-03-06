Rails.application.routes.draw do
  resources :supervises
  resources :faculties
  resources :f_rates
  resources :colleges
  resources :c_rates
  resources :programs
  resources :work_ins
  resources :departments
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'starting/new'

  get 'starting/index'

  get 'starting/start'

  get 'sessions/login'

  get 'users/signup'

  get 'welcome/index'

  resources :clients
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
  get 'signup'  => 'users#signup'
  resources :users

  get 'login' => 'sessions#login'
  resources :sessions

  post 'login' => 'sessions#create'

  post 'start' => 'starting#start'

  delete 'logout' => 'sessions#destroy'

  get 'start' => 'starting#start'

  get 'index' => 'starting#index'

  get 'results' => 'starting#results'

  get 'profile' => 'users#profile'
  resources :users

  get 'users/destroy_account' => 'users#destroy_account'

  delete '/profile' => 'users#destroy_account'

  get 'modifyCurrentStatus' => 'users#modifyCurrentStatus'
  resources :users

  post 'modifyCurrentStatus' => 'users#modifyCurrentStatus'

  get 'modifyEmail' => 'users#modifyEmail'
  resources :users

  post 'modifyEmail' => 'users#modifyEmail'

  get 'modifyFirstName' => 'users#modifyFirstName'
  resources :users

  post 'modifyFirstName' => 'users#modifyFirstName'

  get 'modifyLastName' => 'users#modifyLastName'
  resources :users

  post 'modifyLastName' => 'users#modifyLastName'

  get 'modifyUsername' => 'users#modifyUsername'
  resources :users

  post 'modifyUsername' => 'users#modifyUsername'

  get 'modifyYear' => 'users#modifyYear'
  resources :users

  post 'modifyYear' => 'users#modifyYear'
  
  get 'modifyShowComments' => 'users#modifyShowComments'
  resources :users

  post 'modifyShowComments' => 'users#modifyShowComments'
  
  get 'collegeProfile' => 'starting#collegeProfile'
  resources :starting
  
  get 'rateThisCollege' => 'starting#rateThisCollege'
  resources :starting
  
  post 'rateThisCollege' => 'starting#rateThisCollege'
end
