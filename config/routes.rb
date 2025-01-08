Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products", to: "products#create"

  get "/products/:id", to: "products#show"

  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"
  put "/products/:id", to: "products#update"

  delete "/products/:id", to: "products#destroy"

  root "products#index"

  get "signup", to: "registrations#new1"
  post "signup", to: "registrations#create"

  resources :products do
    resources :subscribers, only: [ :create ]
  end

  resource :unsubscribe, only: [ :show ]
end
