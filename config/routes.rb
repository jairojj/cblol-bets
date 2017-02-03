Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get "/jogos", to: 'jogos#index'
  get "/aposta/new", to: 'bet#new'
  get "/aposta/index", to: 'bet#index'
  get "/ranking", to: "ranking#index"
  post '/aposta/create', to: 'bet#create'
  root to: 'home#index' 
end
