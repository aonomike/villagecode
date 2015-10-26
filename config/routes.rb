Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments,:post_tags
  end

  resources :volunteers
  resources :subscribers
  resources :events

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]


  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  get '/about'=>'visitors#about',:as =>:about
  get '/blog'=>'visitors#blog',:as =>:blog
  get '/codeclub'=>'visitors#codeclub',:as =>:codeclub
  get '/contact'=>'visitors#contact',:as =>:contact
  get '/sponsor'=>'visitors#sponsor',:as =>:sponsor
  get '/tbc'=>'visitors#tbc',:as =>:tbc
  get '/make'=>'visitors#make',:as =>:make
  get '/volunteer'=>'visitors#volunteer'
  post '/change_role'=>'users#change_role'
  
  

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
