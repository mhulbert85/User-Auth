Rails.application.routes.draw do
  root 'pages#index'

  # Pages
  get 'terms', to: 'pages#terms', as: :terms
  get 'privacy', to: 'pages#privacy', as: :privacy

  scope module: :users do
    # Registraitons
    get 'register', to: 'registrations#new'
    post 'register', to: 'registrations#create'
    delete 'delete_user', to: 'registrations#destroy'

    # Confirmations
    match 'email/:token/:purpose', to: 'confirmations#email', via: %i[get patch], as: :email

    # Sessions
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    # Passwords
    get 'forgot', to: 'passwords#new'
    post 'forgot', to: 'passwords#create'
    get 'passwords/:token/edit', to: 'passwords#edit', as: :edit_password
    patch 'passwords/:token/edit', to: 'passwords#update'

    # Omniauth
    match 'auth/:provider/callback', to: 'omniauth#callback', via: %i[get post]
    get 'auth/failure', to: 'omniauth#failure'

    # Accounts
    get 'dashboard/:id', to: 'accounts#dashboard', as: :user
  end
end
