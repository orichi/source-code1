Webtempl::Application.routes.draw do |map|
  match '/console' => 'admin/console#index', :as => :console
  match '/customer_dashboard' => 'customer/dashboard#index', :as => :customer_dashboard
  match '/business_dashboard' => 'business/dashboard#index', :as => :business_dashboard
  match '/businesses/:id/r/:cid' => 'businesses#show', :as => :biz

  resource :sitemap
  resources :msgs
  resources :articles
  resources :sessions
  resources :carts do
    collection do
      get :success_tip
      get :overview
    end
  end
  resources :businesses do
    resources :comments
  end
  resources :customers do
   collection do
     get :active
   end
  end
  resources :customer_sessions
  resources :business_sessions
  resources :activities
  resources :collections
  resources :categories do
    collection do
      post :children_select
    end
  end

  namespace :customer do
    resources :attentions
    resources :partakes do
      collection do
        get :add
        get :bill
      end
      member do
        post :pay
      end
    end
    resources :alipyments do
      member do
        get :return_back
        post :notify
      end
    end
    resources :payments do
      member do
        post :pay
        get :confirm
      end
    end
    resources :friends
    resource :profile
  end

  namespace :business do
    resources :subjects do
      collection do
        get :choose_subjects
      end
    end
    resources :activities do
      member do
        get :subjects
        post :add_subjects
        delete :remove_subject
        put :publish
      end
      resources :discount_rules
    end
    resources :takemoneies
    resources :varieties
    resource :profile do
      post :exchange
    end
    resources :discusses, :controller => :comments
  end
  
  namespace :admin do
    resources :takemoneies
    resources :msgs
    resources :categories
    resources :opeartions
    resources :comments
    resources :emails
    namespace :score do
      resources :busscores
      resources :cusscores
      resources :user do
        collection do
          get :login
          post :slogin
          get :logout
        end
      end
    end
    resources :businesses do
      resources :subjects
      resources :activities
      resources :varieties
    end
    resources :customers
    resources :collections
  end

  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "main#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
