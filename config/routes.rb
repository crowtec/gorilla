Rails.application.routes.draw do
  root 'welcome#index'
  get 'verify' => 'welcome#verify'
  post 'final' => 'welcome#final'

  resources :transaction

end
