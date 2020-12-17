Rails.application.routes.draw do
  resources :rooms do
    resources :reservations, only: [:create]
    member do
      get 'room'
      get 'price'
      get 'description'
      get 'photos'
      get 'amenities'
      get 'location'
      get 'preview'
      get 'preload'
    end
    resources :photos, only: [:create, :destroy]
  end

  get '/your_reservations' => 'reservations#your_reservations'
  get '/your_trips' => 'reservations#your_trips'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users
  resources :reviews
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
