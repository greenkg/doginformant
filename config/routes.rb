Rails.application.routes.draw do

  root :to => 'home#index'

  get 'dogs/breed-matcher' => 'dogs#breed_matcher'
  resources :dogs

  resource :session

  resources :users
  get 'signup' => 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
