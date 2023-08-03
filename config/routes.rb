Rails.application.routes.draw do
  root to: "home#index"
   get '/projects', to: 'projects#index', as: 'projects'
   get '/about', to: 'about#index', as: 'about'
   devise_for :users, path: '', path_names: { sign_up: 'register', sign_in: 'login' }, controllers: { sessions: "sessions", registrations: "registrations" }
end
