Rails.application.routes.draw do
  resources :fees
  resources :course_units
  resources :units, only: [:index]
  resources :courses, only: [:index, :show]
  resources :admins
  resources :students, only: [:create, :update]
  
  post "/login", to: "sessions#create"
  get "/me", to: "students#logged_in"
  delete "/logout", to: "sessions#destroy"
end
