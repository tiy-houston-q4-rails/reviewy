Rails.application.routes.draw do

  post "cart" => "charges#cart", as: :cart

  post "charges" => 'charges#create', as: :charges
  get "charge/:id" => 'charges#show', as: :charge

  get 'tacos' => 'tacos#search', as: :tacos_search
  post 'tacos' => 'tacos#results', as: :tacos_results


  get 'reviews' =>'reviews#search', as: :reviews_search
  post 'reviews' => 'reviews#results', as: :results

  get 'users/new', as: :sign_up
  post "users" => 'users#create', as: :users

  devise_for :users
  root 'page#public'

  get '/private' => 'page#private', as: :private

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
