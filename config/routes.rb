Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get "/jogos", to: 'jogos#index'
  root to: 'home#index' 
end
