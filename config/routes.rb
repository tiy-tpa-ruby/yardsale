Rails.application.routes.draw do
  resources :items
  get 'pages/landing'

  root 'pages#landing'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  '/signup' => 'users#new'
  post '/users'  => 'users#create'

  get  '/login'   => 'sessions#new'
  post '/login'   => 'sessions#create'
  get  '/logout'  => 'sessions#destroy'

  mount Shrine::DownloadEndpoint => "/attachments"
end
