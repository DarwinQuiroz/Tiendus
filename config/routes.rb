Rails.application.routes.draw do

  devise_for :users

  resources :attachments, only: [:new, :create, :destroy]
  resources :products
  resources :in_shopping_carts, only: [:create, :destroy]

  post "/emails/create", as: :create_email
  post "/pagar", to: "payments#create"
  post "/payments/cards", to: "payments#process_card"

  get "/carrito", to: "shopping_carts#show"
  get "/add/:product_id", as: :add_to_cart, to: "in_shopping_carts#create"
  get "/checkout", to: "payments#checkout"
  get "/ok", to: "welcome#payment_success"
  get "/download/:id", to: "links#download"
  get "/download/:id/attachment/attachment_id", to: "links#download_attachment", as: :download_attachment
  get "/invalid", to: "welcome#unregistered"
  
  authenticated :user do
  	root 'welcome#index'
  end

  unauthenticated :user do
  	devise_scope :user do
  		root 'welcome#unregistered', as: :unregistered_root 
  	end
  end
end
