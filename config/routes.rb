CoffeeSpec::Application.routes.draw do

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#fail'

  resources :companies, :only => [:show, :update] do
    resources :drinks do
      member do
        get :want
        get :making
      end
    end

  end
  resource :sessions

  match "/t/:token" => "application#token_route", :as => :token

  root :to => "application#landing"

  match "*path" => "application#not_found" #404

end
