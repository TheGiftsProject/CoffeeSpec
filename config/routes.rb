CoffeeSpec::Application.routes.draw do

  match '/auth/:provider/callback' => 'authentication#create'

  match "coffee" => "application#debug"

  resources :drinks

  root :to => "drinks#index"

end
