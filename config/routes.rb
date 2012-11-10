TheBest::Application.routes.draw do
	get '/auth/:provider/callback' => 'sessions#create'
  get '/signin/:provider' => 'sessions#new', :as => :signin
  delete '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  root :to => 'home#index'
end
