Rails.application.routes.draw do
  resources :folders

  devise_for :users
 
  root to: 'static#home'
  resources :assets

  get 'assets/get/:id', to: 'assets#get', as: :download_asset
  get 'browse/:id', to: 'static#browse', as: :browse
end
