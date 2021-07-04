Rails.application.routes.draw do
  resources :accounts, only: %i[create update destroy show]
  resources :statements, only: %i[index]
  scope module: 'statements' do
    resources :deposits, only: %i[create]
    resources :withdraws, only: %i[create]
  end

  scope module: 'accounts' do
    resources :balance, only: %i[index]
  end
end
