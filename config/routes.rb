CoffeeSpec::Application.routes.draw do

  match '/auth/:provider/callback' => 'sessions#create'

  resources :drinks

  resource :sessions

  match "/view/:token" => "drinks#view", :as => :share

  root :to => "application#landing"

end
