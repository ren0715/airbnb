Rails.application.routes.draw do
  resources :rooms do
    member do
      get 'room'
      get 'price'
      get 'description'
      get 'photos'
      get 'amenities'
      get 'location'
    end
    resources :photos, only: [:create, :destroy]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
