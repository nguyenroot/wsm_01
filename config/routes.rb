Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    root "projects#index"
    resources :projects
  end

  root "static_pages#home"
  get "static_pages/help"
end
