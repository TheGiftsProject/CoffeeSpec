CoffeeSpec::Application.routes.draw do

  match '/auth/:provider/callback' => 'sessions#create'

  resources :drinks

  resource :sessions

  root :to => "application#landing"

end
