Rails.application.routes.draw do
  constraints :subdomain => 'admin' do
    mount RailsAdmin::Engine => '/', as: 'rails_admin'
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get "/jogos", to: 'jogos#index'
  get "/aposta/new", to: 'bet#new'
  get "/aposta/index", to: 'bet#index'
  get "/ranking", to: "ranking#index"
  post '/aposta/create', to: 'bet#create'
  root to: 'home#index' 
end
