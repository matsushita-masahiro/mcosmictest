Rails.application.routes.draw do




  root 'home#top'
  get 'home/readme' => 'home#readme'
  devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
   }
   
   
   resources :users, :only => [:index, :edit, :update]
   post 'reservations/make_holiday/:date/:space' => 'reservations#make_holiday'
   get 'reservations/my_reserved' => 'reservations#my_reserved'
   resources :reservations
   resources :user_types
   post 'reservations/confirm' => 'reservations#confirm'
   
   resources :inquiries

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
