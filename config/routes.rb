Rails.application.routes.draw do
  # Set a home page route
  # root 'welcome#index'

  # Omniauth authentication. Remember to setup a controller and an action
  get 'auth/:service/callback', to: 'external_authentications#create'
  get 'auth/failure', to: 'external_authentications#failure'
end
