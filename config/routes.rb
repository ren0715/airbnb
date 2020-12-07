Rails.application.routes.draw do
  resources :rooms do
    member do
      get 'room'
      #patch 'room_update'
      get 'price'
      #patch '_update'
      get 'description'
      #patch 'description_update'
      get 'photos'
      #patch 'photos_update'
      get 'amenities'
      #patch 'amenities_update'
      get 'location'
      #patch 'location_update'
    end
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
