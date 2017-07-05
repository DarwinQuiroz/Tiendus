Rails.application.routes.draw do
  
  devise_for :users
  resources :attachments, only: [:new, :create, :destroy, :show]
  resources :products
  resources :in_shopping_carts, only: [:create, :destroy]

  post "/emails/create", as: :create_email

  get "/carrito", to: "shopping_cart#show"
  
  authenticated :user do
  	root 'welcome#index'
  end

  unauthenticated :user do
  	devise_scope :user do
  		root 'welcome#unregistered', as: :unregistered_root 
  	end
  end
end
