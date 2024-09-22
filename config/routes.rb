Rails.application.routes.draw do
    root 'sessions#new'
    
    get 'home/index'
    resource :registration
    resource :session
    resource :password_reset
    resource :password
    resources :students

end
