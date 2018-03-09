Rails.application.routes.draw do
  devise_for :users, path: '',
   controllers:{
     
	  registrations: 'users/registrations', except: [:edit],
    sessions: 'users/sessions'
	},
  path_names:{
    sign_in: 'login', sign_out: 'logout', sign_up: 'registrations'
  }
  root 'home#index'
  get '/about' => 'home#about' 
  get '/faq' => 'home#faq'
  get '/account' => 'users#show'
  get 'auth/bnet/callback' => 'search#auth_callback'
  get '/auth' => 'search#bnet_auth'

  get '/get_realm_by_region/:region' => 'search#get_realm_list'
end
