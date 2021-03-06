CollectiveMind::Application.routes.draw do

  root to: 'home#index'
  ActiveAdmin.routes(self)
  get 'about', to: 'home#about'
  get 'help', to: 'home#help'
  get 'contact', to: 'home#contact'
  get 'sitemap', to: 'home#sitemap'

  get 'tags', to: 'home#tags', as: :tags
  get 'questions/tagged/:tag', to: 'questions#index', as: :tagged_questions
  get 'questions/by_user/:id', to: 'questions#by_user', as: :users_questions
  get 'my_questions/', to: 'questions#my_questions', as: :my_questions

  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions'}

  resources :users, only: [:index, :show, :update, :edit]
  post 'questions/vote', to: 'questions#vote'
  post 'solutions/vote', to: 'solutions#vote'
  resources :questions do
    resources :solutions, only: [:create]
  end

  resources :friendships, only: [:create, :destroy]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
