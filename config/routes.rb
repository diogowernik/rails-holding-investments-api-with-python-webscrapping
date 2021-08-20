Rails.application.routes.draw do
  resources :portfolios
  resources :portfolio_criptos
  resources :portfolio_fiis
  resources :criptos
  resources :fiis
  
  get 'portfolio/:id/composition', to: 'portfolios#composition', as: 'portfolio_composition'
  get 'portfolio/:id/radar', to: 'portfolios#radar', as: 'portfolio_radar'


  namespace :admin do
    get '/', to: 'categories#index', as: 'dashboard'
    resources :years
    resources :categories
    resources :portfolios
    resources :criptos
    resources :fiis
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

    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to: "sessions#logout"
    get :logged_in, to: "sessions#logged_in"

  end
  resources :tutorials
  resources :tasks
  resources :sinteticos
  resources :proventos
  
  resources :deriva_tipos
  resources :ativo_moves
  resources :vencimentos
  resources :corretoras
  resources :deriva_moves
  resources :derivativos
  resources :estados
  resources :investimentos
  resources :atividades
  resources :ativos
  resources :tipos
  resources :carteiras
  devise_for :users
  root to: 'portfolios#index'
  
  get 'seed', to: 'pages#seed', as: 'pages_seed'
  get 'for_google', to: 'pages#for_google', as: 'pages_for_google'
  get 'onde-investir-puts', to: 'pages#onde_investir_puts', as: 'pages_onde_investir_puts'


  get 'deriva_moves/new_put/:carteira_id/:ativo_id', to: 'deriva_moves#new_put', as: 'new_put'
  get 'deriva_moves/new_put_from_investimentos/:carteira_id/:ativo_id/:corretora_id/:investimento_id', to: 'deriva_moves#new_put_from_investimentos', as: 'new_put_from_investimentos'
  get 'deriva_moves/:id/edit_put', to: 'deriva_moves#edit_put', as: 'edit_put'
  
  get 'deriva_moves/new_call/:carteira_id/:ativo_id', to: 'deriva_moves#new_call', as: 'new_call'
  get 'deriva_moves/new_call_from_investimentos/:carteira_id/:ativo_id/:corretora_id/:investimento_id', to: 'deriva_moves#new_call_from_investimentos', as: 'new_call_from_investimentos'
  get 'deriva_moves/:id/edit_call', to: 'deriva_moves#edit_call', as: 'edit_call'

  get 'investimentos/new_garantia/:carteira_id/', to: 'investimentos#new_garantia', as: 'new_garantia'

  get 'carteiras/:id/radar_puts', to: 'carteiras#radar_puts', as: 'radar_puts'
  get 'carteiras/:id/radar_calls', to: 'carteiras#radar_calls', as: 'radar_calls'
  get 'carteiras/:id/alocacao_puts', to: 'carteiras#alocacao_puts', as: 'alocacao_puts'
  get 'carteiras/:id/alocacao_calls', to: 'carteiras#alocacao_calls', as: 'alocacao_calls'
  get 'carteiras/:id/dividendo_sintetico', to: 'carteiras#dividendo_sintetico', as: 'dividendo_sintetico'
  get 'carteiras/:id/meus_proventos', to: 'carteiras#meus_proventos', as: 'meus_proventos'
end
