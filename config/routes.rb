Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :wagons
  resources :coupe_wagons, controller: 'wagons', type: 'CoupeWagon'
  resources :economy_wagons, controller: 'wagons', type: 'EconomyWagon'
  resources :seated_wagons, controller: 'wagons', type: 'SeatedWagon'
  resources :sleeping_wagons, controller: 'wagons', type: 'SleepingsWagon'

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
