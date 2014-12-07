Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #For likes
  match 'like' => 'users#like', :via => [:post]
  match 'unlike' => 'users#unlike', :via => [:post]

  resources :locations
  resources :trips_invites do
    collection do
      post 'requestTrip'
      # post 'acceptRequest'
      # post 'declineRequest'
      # get 'hasJoiningTripBeenRequested'
    end
  end

  resources :trips do
    resources :albums do
      resources :albums_comments
      resources :albums_ratings
    end
    resources :attachments do
      resources :attachment_comments
      resources :attachment_ratings
    end
    collection do
      get 'search'
      get 'invite'
      get 'showTripNotifications'
    end
  end

  resources :users do
    collection do
      get 'search'
      get 'recommend'
    end
  end

  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'trips#index'
  root 'trips#index'
  get 'friend/:id', to: 'users#addFriend', as: 'friend'


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
