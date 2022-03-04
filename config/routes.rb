Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # root to: 'categories#index'
  
  resources :categories do
    resources :tasks
    # do
    # collection do
    #   get 'due_today'
    # end

    # for this category lang
  end
  get "/tasks/due_today", to: "tasks#due_today"
  # di na need ng category id kasi di naman to kasali sa nested routes
  # nil ang value ng params[:category_id] dito kasi wala naman params na category id yung route na to
  get "/tasks/backlog", to: "tasks#backlog"
end
