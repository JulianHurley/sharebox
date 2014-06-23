Rails.application.routes.draw do
  devise_for :users
 
  root to: 'static#home'
  resources :assets

  get 'assets/get/:id', to: 'assets#get', as: :download_asset

end
