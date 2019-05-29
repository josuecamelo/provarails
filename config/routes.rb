Rails.application.routes.draw do
  resources :reservas
  resources :carros
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'importacao/new' => 'importacao#new'
  post 'importacao/create' => 'importacao#create'

  root 'carros#index'
end
