Rails.application.routes.draw do

  resources :portfolio_stocks
  resources :portfolio_holding_tokens
  resources :portfolio_etfs
  resources :portfolio_subscriptions
  resources :portfolio_currencies
  resources :portfolio_fixed_incomes
  resources :portfolio_puts
  resources :portfolio_calls
  resources :portfolio_properties
  resources :portfolio_br_stocks
  resources :portfolio_criptos
  resources :portfolio_fiis
  resources :portfolios

  get 'portfolio/:id/international', to: 'portfolios#international', as: 'portfolio_international'
  get 'portfolio/:id/calls_management', to: 'portfolios#calls_management', as: 'portfolio_calls_management'
  get 'portfolio/:id/puts_management', to: 'portfolios#puts_management', as: 'portfolio_puts_management'
  get 'portfolio/:id/br_stocks_management', to: 'portfolios#br_stocks_management', as: 'portfolio_br_stocks_management'
  get 'portfolio/:id/fiis_management', to: 'portfolios#fiis_management', as: 'portfolio_fiis_management'
  get 'portfolio/:id/criptos_management', to: 'portfolios#criptos_management', as: 'portfolio_criptos_management'
  get 'portfolio/:id/subscriptions_management', to: 'portfolios#subscriptions_management', as: 'portfolio_subscriptions_management'


  root to: 'portfolios#index'
  devise_for :users

  namespace :admin do
    get '/', to: 'categories#index', as: 'dashboard'
    resources :years
    resources :categories
    resources :portfolios
    resources :criptos
    resources :fiis
    resources :br_stocks
    resources :puts
    resources :calls
    resources :months
    resources :properties
    resources :expirations
    resources :stocks
    resources :etfs
    resources :holding_tokens
    resources :subscriptions
    resources :currencies
    resources :fixed_incomes
    resources :situations

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
    get 'portfolio/:id/br_stocks_chart', to: 'portfolios#br_stocks_chart', as: 'portfolio_br_stocks_chart'
    get 'portfolio/:id/criptos_chart', to: 'portfolios#criptos_chart', as: 'portfolio_criptos_chart'
    get 'portfolio/:id/fiis_chart', to: 'portfolios#fiis_chart', as: 'portfolio_fiis_chart'
    get 'portfolio/:id/currencies_chart', to: 'portfolios#currencies_chart', as: 'portfolio_currencies_chart'
  end
end
