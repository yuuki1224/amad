Amad::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount Resque::Server, :at => "/resque"

  root :to => 'index#index'
  get 'index/success_login'
  get 'index/invite_friend'

  namespace 'api' do
    get 'friends/index'
    get 'friends/get_friends_list'
    get 'friends/get_groups_list'
    get 'friends/add_friend'
    get 'friends/block_person'
    get 'comads/get_comads_list'
    post 'comads/create_comad'
    get 'comads/attend_comad'
    get 'user/get_add_friends'
    post 'user/update_image'
    put 'user/update_profile'
    put 'user/update_account'
    put 'user/update_notification'
    put 'user/update_mail'
    get 'user/find_user'
    post 'group/create_group'
  end

  resources :comads

  devise_scope :user do
#    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
#    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end


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
