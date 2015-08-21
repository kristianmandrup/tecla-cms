TeclaCms::Engine.routes.draw do
  devise_for :users
  mount Api::Root => '/'
end
