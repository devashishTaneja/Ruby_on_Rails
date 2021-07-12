Rails.application.routes.draw do
  resources :microposts
  get 'sessions/new'
  resources :users
  get 'signup'=>'users#new'
  get 'edit' => 'users#edit'
  get 'profile' => 'users#show'
  # get 'static_pages/home'
  root 'static_pages#home'
  get 'help'=>'static_pages#help'
  get 'about'=>'static_pages#about'
  get 'contact'=>'static_pages#contact'
	# Sessions
	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout'  => 'sessions#destroy'
end
