Rails.application.routes.draw do
  root 'anautomy#home'
  get 'home' => 'anautomy#home'
  get 'about' => 'anautomy#about'
  get 'oaq' => 'anautomy#oaq'
  get 'transparency' => 'anautomy#transparency'
  get 'submission' => 'anautomy#submission'
  #get 'new_submission' => "repair_submissions#new"
  get 'search' => "repair_submissions#search"
  get 'results' => "shops#search_result"



  get 'repairs' => 'anautomy#repairs'
  get 'submissions' => 'anautomy#submissions'
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
  match 'snap', to: 'invoices#new', via: [:get, :post]
  resources :anautomy do
  get :home, :on => :collection
  end

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
