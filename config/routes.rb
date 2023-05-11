Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  put '/change_status', to: 'home#change_status'
  put '/initialize_call', to: 'home#initialize_call'
  put '/cancel_call', to: 'home#cancel_call'
end
