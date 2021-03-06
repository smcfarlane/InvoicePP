Rails.application.routes.draw do

  get 'invoices/' => 'project_invoices#index_all', as: :invoices
  get 'invoices/new/' => 'project_invoices#new_with_project', as: :invoices_new
  post 'invoices/' => 'project_invoices#create_with_project'
  get 'mark_paid/:id' => 'project_invoices#mark_paid', as: :mark_paid
  get 'client/:client_id/invoices/' => 'project_invoices#index_client', as: :client_invoices

  resources :vendors

  resources :clients do
    resources :projects
  end

  resources :projects do
    resources :project_invoices, execpt: [:create]
  end
  post 'add_vendor_to_project/:id' => 'vendors#add_vendor_to_project', as: :vendor_to_project
  get 'all_projects/' => 'projects#index_all', as: :all_projects
  get 'pages/index'

  devise_for :users

  root 'pages#index'

  # Dashboard
  get 'dashboard/' => 'dashboard#index', as: :dashboard

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
