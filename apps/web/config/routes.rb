root to: 'home#index'

get '/signup', to: 'accounts#new', as: :get_signup
post '/signup', to: 'accounts#create', as: :post_signup
get '/accounts/:id', to: 'accounts#show', as: :get_account
patch '/accounts/:id', to: 'accounts#update', as: :update_account
delete '/accounts/:id', to: 'accounts#destroy', as: :destroy_account

get '/signin', to: 'authentications#new', as: :get_signin
post '/signin', to: 'authentications#create', as: :post_signin
delete '/signout', to: 'authentications#destroy', as: :delete_signout
