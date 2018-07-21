Rails.application.routes.draw do
resources :campaigns
  resource :beacons do
    resource :beacons_items
  end 
root 'beacons#index'
end
