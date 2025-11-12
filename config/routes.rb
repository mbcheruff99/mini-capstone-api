Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"


# get - index
  get "/products" => "products#index"

  get"/suppliers" => "suppliers#index"


  # get - show
  get "/products/:id" => "products#show"

  get "/suppliers/:id" => "suppliers#show"


  #post - create
  post "/products" => "products#create"

  post "/suppliers" => "suppliers#create"

  #put - update
  put "/products/:id" => "products#update"

  put "/suppliers/:id" => "suppliers#update"

  #delete - destroy
  delete "/products/:id" => "products#destroy"

  delete "/suppliers/:id" => "suppliers#destroy"
end
