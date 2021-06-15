Rails.application.routes.draw do


  root to: 'users#top'
  get 'home/about' =>'users#about'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :index ]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]


end

