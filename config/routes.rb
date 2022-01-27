Rails.application.routes.draw do
  resources :trains do 
    resources :wagons, shallow: true 
  end
  
  resources :railway_stations do 
    patch :update_position, on: :member
    patch :update_departure_time, on: :member
    patch :update_arrival_time, on: :member
  end

  resources :tickets
  resources :routes
  resources :wagons
  resources :coupe_wagons, controller: 'wagons', type: 'CoupeWagon'
  resources :economy_wagons, controller: 'wagons', type: 'EconomyWagon'
  resources :seated_wagons, controller: 'wagons', type: 'SeatedWagon'
  resources :sleeping_wagons, controller: 'wagons', type: 'SleepingsWagon'

  resource :search, only: [:new, :show, :edit]

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
