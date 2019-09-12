Rails.application.routes.draw do
#  get 'users/show'
  resources :goals
  resources :events
  resources :activities
  root 'welcome#home'
  devise_for :users

  get 'profile', to:'users#show'
  get 'welcome', to:'welcome#welcome'
  get 'about', to: 'welcome#about'
  get 'dietetic', to:'welcome#dietetic'
  get 'trainer', to: 'welcome#trainer'
  get 'search', to: 'events#search'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
