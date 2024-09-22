Rails.application.routes.draw do
    root 'home#index'
    # root 'sessions#new'
    resource :registration
    resource :session
    resource :password_reset
    resource :password
    resources :students

end
