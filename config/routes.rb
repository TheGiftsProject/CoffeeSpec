CoffeeSpec::Application.routes.draw do

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#fail'

  resources :companies, :only => [:show, :update] do
    resources :drinks
  end
  resource :sessions

  match "/drinks/:drink_token/wants" => "drinks#wants"
  match "/drinks/:drink_token/making" => "drinks#making"
  match "/drinks/:drink_token/edit" => "drinks#edit"

  match "/t/:token" => "application#token_route", :as => :token

  root :to => "application#landing"

  match "*path" => "application#not_found" #404

end
