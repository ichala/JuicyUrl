Rails.application.routes.draw do
 
  devise_for :users
  get "/links", to: "links#index" , as: "links"
  get "/links/:id", to: "links#details" , as: "link_details"
  post "/", to: "home#save"
  get '/:id', to: 'home#redirect'
  # Defines the root path route ("/")
  root "home#index"
end
