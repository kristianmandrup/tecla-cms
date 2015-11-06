Cms::Engine.routes.draw do
  root to: "pages#index"
  devise_for :users, class_name: "Cms::User",  module: :devise
  
  #resources :pages
  mount Api::Root => '/'
end
