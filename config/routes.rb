Rails.application.routes.draw do
  resources :profiles
	devise_for :users, controllers: {
		users: 'users/registrations'
		# sessions: 'users/sessions'
	}
	resources :posts
  root to: 'static#homepage'
end
