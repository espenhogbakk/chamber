Chamber::Application.routes.draw do

  devise_for :users

  resources :users
  resources :messages
  resources :rooms do
    resources :messages
    resources :participants
  end

  #resources :assets

  resources :attachments
  resources :app
  
  #match "/assets/*:id" => "assets#show"
  
  root :to => "app#index"

end

