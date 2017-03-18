Rails.application.routes.draw do
  resources :events
  devise_for :users
    root to: 'pages#home'    
    get 'about', to: 'pages#about'
    resources :users do
      resource :profile
    end
    resources :contacts, only: :create 
    resources :events
    get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
