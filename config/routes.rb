Rails.application.routes.draw do
  resources :activities
  root 'welcome#home'
  devise_for :users


  get 'welcome', to:'welcome#welcome'
  get 'about', to: 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
