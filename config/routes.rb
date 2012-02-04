Chamber::Application.routes.draw do

  devise_for :users

  resources :users
  resources :messages
  resources :rooms do
    resources :messages
    resources :participants
  end

  resources :attachments
  resources :app
  
  root :to => "app#index"

end

