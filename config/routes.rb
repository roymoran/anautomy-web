Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'shop_users/new'

  get 'sessions/new'

  root 'anautomy#home'
  get 'home' => 'anautomy#home'
  get 'about' => 'anautomy#about'
  get 'oaq' => 'anautomy#oaq'
  get 'transparency' => 'anautomy#transparency'
  get 'submission' => 'anautomy#submission'
  #get 'new_submission' => "repair_submissions#new"
  get 'search' => "repair_submissions#search"
  get 'show' => "repair_submissions#show"
  get 'results' => "shops#search_result"


  get 'repairs' => 'anautomy#repairs'
  get 'submissions' => 'anautomy#submissions'
  
  # signup, login, and logout routes for car owners
  get  '/signup',  to: 'car_owners#new'
  post '/signup',  to: 'car_owners#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # signup, login, and logout routes for shop users
  get  '/signup_shop',  to: 'shop_users#new'
  post '/signup_shop',  to: 'shop_users#create'
  get    '/login_shop',   to: 'sessions#new_shop'
  post   '/login_shop',   to: 'sessions#create_shop'
  delete '/logout_shop',  to: 'sessions#destroy_shop'

  get '/anautomy/home'
  get '/repair_submissions/search'

  #root 'static_pages#home'
  #root 'anautomy#welcome'
  #root 'anautomy#homepage'
  #post   'sub'   => 'subscribers#create'
  resources :subscribers
  resources :repair_submissions

  resources :anuatomy
  resources :shops
  resources :invoices
  resources :car_owners
  resources :shop_users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  match 'snap', to: 'invoices#new', via: [:get, :post]

  resources :anautomy do
  get :home, :on => :collection
  end

  # ajax routes for repair submission form
  get 'fetch_car_makes' => "repair_submissions#fetch_car_makes"
  get 'fetch_car_models' => "repair_submissions#fetch_car_models"
  get 'fetch_car_options' => "repair_submissions#fetch_car_options"

  # ajax route for user dashboard
  get 'api/model_year_id' => "car_owners#model_year_id"
  get 'api/maintenance_schedule' => "car_owners#maintenance_schedule"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
