Rails.application.routes.draw do
  # needed to allow react to run, 
  # without this react wasnt pulling from backend
  get "up" => "rails/health#show", as: :rails_health_check

  # this generates CRUD routing for movie resoruces.
  resources :movies
end
