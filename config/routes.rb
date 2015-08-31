Rails.application.routes.draw do
  
  Spree::Core::Engine.routes.draw do
    # get '/all_product_user' => "products#all_product_user"
    # post '/new_product' => "products#create"
    # get '/new_product' => "products#new"
    # get '/show_product_user/:id' => "products#show_product_user", as: :show_product_user
    # get '/edit_product_user/:id' => "products#edit_product_user", as: :edit_product_user
    # put '/update_product_user/:id' => "products#update_product_user", as: :update_product_user
    # delete '/destroy_product_user/:id' => "products#destroy_product_user", as: :destroy_product_user
    # get '/new_image_product_user/:id' => "products#new_image_product_user", as: :new_image_product_user
    # post '/create_image_product_user' => "products#create_image_product_user"
    # resources :products do
    #   member do
    #    get ':id/edit' => "products#edit_product_user", as: :edit_product_user
    #   end
    # end
    get 'user/products' => "products#all_product_user",as: :all_product_user
    post '/new_product' => "products#create"
    get 'user/new_product' => "products#new"
    put '/update_product_user/:id' => "products#update_product_user", as: :update_product_user
    delete '/destroy_product_user/:id' => "products#destroy_product_user", as: :destroy_product_user
    post '/create_image_product_user' => "products#create_image_product_user"
    delete 'detroy_image_product/:id' => "products#destroy_image_product", as: :destroy_image_product

    resources :products do
      member do
        get 'edit'
        get 'new_image'
      end
    end
  end
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/'
          # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
