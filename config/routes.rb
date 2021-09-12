Rails.application.routes.draw do

  resources :portfolio_internationals
  resources :portfolio_stocks
  resources :portfolio_subscriptions
  resources :portfolio_fixed_incomes
  resources :portfolio_puts
  resources :portfolio_calls
  resources :portfolio_properties
  resources :portfolio_br_stocks
  resources :portfolio_criptos
  resources :portfolio_fiis
  resources :portfolios

  get 'portfolio/:id/internationals_management', to: 'portfolios#internationals_management', as: 'portfolio_internationals_management'
  get 'portfolio/:id/calls_management', to: 'portfolios#calls_management', as: 'portfolio_calls_management'
  get 'portfolio/:id/puts_management', to: 'portfolios#puts_management', as: 'portfolio_puts_management'
  get 'portfolio/:id/br_stocks_management', to: 'portfolios#br_stocks_management', as: 'portfolio_br_stocks_management'
  get 'portfolio/:id/fiis_management', to: 'portfolios#fiis_management', as: 'portfolio_fiis_management'
  get 'portfolio/:id/criptos_management', to: 'portfolios#criptos_management', as: 'portfolio_criptos_management'
  get 'portfolio/:id/fixed_incomes_management', to: 'portfolios#fixed_incomes_management', as: 'portfolio_fixed_incomes_management'
  get 'portfolio/:id/properties_management', to: 'portfolios#properties_management', as: 'portfolio_properties_management'
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
      resources :subscriptions
      resources :fixed_incomes
    resources :situations
    resources :internationals
    resources :international_categories
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
    get 'portfolio/:id/internationals_chart', to: 'portfolios#internationals_chart', as: 'portfolio_internationals_chart'
    get 'portfolio/:id/fixed_incomes_chart', to: 'portfolios#fixed_incomes_chart', as: 'portfolio_fixed_incomes_chart'

    get 'portfolio/:id/properties_chart', to: 'portfolios#properties_chart', as: 'portfolio_properties_chart'

  end
end
