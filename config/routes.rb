Rails.application.routes.draw do
  root 'home#index'
    
  resources :home do
  end
  
  resources :pages do
  end
  
  resources :translations
  
  get "index" => "home#index"
  
end
