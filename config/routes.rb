Rails.application.routes.draw do


  root 'home#top'
  get 'home/readme' => 'home#readme'
  devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
   }
   
   
   resources :users, :only => [:index, :edit, :update]
   get '/reservations/my_reserved' => 'reservations#my_reserved'
   resources :reservations
   resources :user_types
   post '/reservations/confirm' => 'reservations#confirm'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
