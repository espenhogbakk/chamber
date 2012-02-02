Chamber::Application.routes.draw do

  devise_for :users

  resources :messages
  resources :rooms do
    resources :messages
  end

  #resources :assets  
  resources :app
  
  #match "/assets/*:id" => "assets#show"
  
  root :to => "app#index"

end
