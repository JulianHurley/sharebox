Rails.application.routes.draw do
  resources :folders

  devise_for :users
 
  root to: 'static#home'
  resources :assets

  get 'assets/get/:id', to: 'assets#get', as: :download_asset

  get 'browse/:id', to: 'static#browse', as: :browse
  get 'browse/:parent_id/new_folder', to: 'folders#new', as: :new_sub_folder
  get 'browse/:parent_id/new_file', to: 'assets#new', as: :new_sub_asset
  get 'browse/:id/edit_folder', to: 'folders#edit', as: :rename_folder
end
