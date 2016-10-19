Rails.application.routes.draw do
  
  get "/", action: :index, controller: "welcome"
  root "welcome#index"

  resources :users # except: [:new]
  # resources :users, only: [:create, :show, :edit, :update, :destroy]
  
  get "/sign_up", action: :new, controller: "users" 
      #before, it was: "to: :new" , but guard gave a deprecated warning and asks to change to "action: :new"
 
  get "/sign_in", action: :new, controller: "sessions"
  get "/signout", action: :destroy, controller: "sessions"

  resources :sessions, only: [:new, :create, :delete]
  resources :statuses 
  resources :likes, only: [:create, :destroy]
 


end


# get 'profile', to: :show, controller: 'users'
