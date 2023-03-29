Rails.application.routes.draw do
  resources :fees
  resources :course_units
  resources :units
  resources :courses
  resources :admins
  resources :students
  post "/login", to: "students#login"
  post "/signup", to: "students#signup"
  get "/me", to: "students#logged_in"
  delete "/logout", to: "sessions#destroy"
end
