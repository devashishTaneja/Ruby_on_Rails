Rails.application.routes.draw do
  resources :microposts

  # Users
  resources :users
  get 'signup'=>'users#new'

  # Static 
  root 'static_pages#home'
  get 'help'=>'static_pages#help'
  get 'about'=>'static_pages#about'
  get 'contact'=>'static_pages#contact'

	# Sessions  
  get 'sessions/new'
  get 'profile' => 'sessions#show'
  get 'update' => 'sessions#edit'
	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout'  => 'sessions#destroy'
end
