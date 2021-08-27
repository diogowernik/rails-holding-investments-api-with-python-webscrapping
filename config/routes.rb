Rails.application.routes.draw do
  
  root to: 'portfolios#index'
  devise_for :users
  resources :portfolio_br_stocks
  resources :portfolio_criptos
  resources :portfolio_fiis
  resources :portfolios
  get 'portfolio/:id/composition', to: 'portfolios#composition', as: 'portfolio_composition'
  get 'portfolio/:id/radar', to: 'portfolios#radar', as: 'portfolio_radar'

  namespace :admin do
    get '/', to: 'categories#index', as: 'dashboard'
    resources :years
    resources :categories
    resources :portfolios
    resources :criptos
    resources :fiis
    resources :br_stocks
    resources :portfolio_br_stocks
    resources :portfolio_fiis
    resources :portfolio_criptos
  end

  namespace :api do
    resources :years
    resources :criptos
    resources :movements
    resources :categories
    resources :portfolios
    resources :fiis
    resources :portfoliocriptos
    resources :portfoliofiis

    get 'portfolio/options', to: 'portfolios#options', as: 'portfolio_options'
    get 'category/options', to: 'categories#options', as: 'category_options'
    get 'fii/options', to: 'fiis#options', as: 'fii_options'
    get 'cripto/options', to: 'criptos#options', as: 'cripto_options'
    get 'portfolio/portfoliofiis/:id', to: 'portfolios#portfoliofiis', as: 'portfolio_portfoliofiis'
    get 'portfolio/portfoliocriptos/:id', to: 'portfolios#portfoliocriptos', as: 'portfolio_portfoliocriptos'
  end
end
