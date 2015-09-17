Cms::Engine.routes.draw do
  devise_for :users
  resources :pages
  mount Api::Root => '/'
end
