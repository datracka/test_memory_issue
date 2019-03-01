Rails.application.routes.draw do
  get 'welcome/index'
  # mount Sidekiq::Web => '/sidekiq'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :good
  resources :bad
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
