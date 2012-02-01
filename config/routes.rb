Chamber::Application.routes.draw do

  resources :messages
  resources :rooms do
    resources :messages
  end

  #resources :assets  
  resources :app
  
  #match "/assets/*:id" => "assets#show"
  
  root :to => "app#index"

end
