Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get "/jogos", to: 'jogos#index'
  get "/aposta/new", to: 'bet#new'
  post '/aposta/create', to: 'bet#create'
  root to: 'home#index' 
end
