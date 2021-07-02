Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root "tasks#index"
  resources :tasks

  # CRUD + other actions
  # resources :tunes do
  #   # play_tune => /tunes/:id/play => tunes#play
  #   get 'play', on: :member
  #   # find_tunes => /tunes/find => tunes#find
  #   get 'find', on: :collection
  #   # preview_new_tune => /tunes/new/preview => tunes#preview
  #   get 'preview', on: :new
  # end

  # 構造化
  # scope :hoge do
  #   resources :users
  # end
  # scope path: 's' do
  #   resources :users
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
