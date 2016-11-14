Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    resources :projects
    resources :project_members
  end

  root "static_pages#home"
  get "static_pages/help"
end
