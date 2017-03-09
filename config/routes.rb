Rails.application.routes.draw do
  devise_for :users
    root to: 'pages#home'    
    get 'about', to: 'pages#about'
    resources :users do
      resource :profile
    end
    resources :contacts, only: :create 
    get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
