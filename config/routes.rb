# frozen_string_literal: true

Rails.application.routes.draw do
  resource :mlit_importer, only: %i[new create] do
    post 'preview'
  end
  resources :bridges do
    resources :bridge_contents do
      resources :bridge_content_inspections
      get 'inspections/:inspection_id/new', action: :new, controller: :bridge_content_inspections_inspections
      post 'inspections/:inspection_id/create', action: :create, controller: :bridge_content_inspections_inspections
    end
    resources :inspections
    resources :soundnesses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  get 'top/index'

  get 'sessions/index'
  post 'sessions/login'
  get 'sessions/logout'

  # admin
  namespace :admin do
    get 'sessions/index'
    post 'sessions/login'
    get 'sessions/logout'
    get 'top/index'
    resources :users
  end
end
