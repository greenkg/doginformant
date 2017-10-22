Rails.application.routes.draw do

  root :to => 'dogs#index'

  get "dogs/breed-matcher" => "dogs#breed_matcher"
  resources :dogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
