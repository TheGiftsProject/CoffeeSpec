CoffeeSpec::Application.routes.draw do

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#fail'

  resources :companies do
    resources :drinks
  end
  resource :sessions

  match "/t/:token" => "application#token_route", :as => :token

  root :to => "application#landing"

end
