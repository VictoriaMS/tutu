Rails.application.routes.draw do
  devise_for :users
  resources :tickets
  resource :search, only: [:new, :show]

  namespace :admin do 
    resources :trains do 
      resources :wagons
    end
    
    resources :tickets
    resources :routes

    resources :railway_stations do 
      patch :update_position, on: :member
      patch :update_departure_time, on: :member
      patch :update_arrival_time, on: :member
    end
  end

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
