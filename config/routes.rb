Rails.application.routes.draw do
  root 'welcome#index'
  get 'verify' => 'welcome#verify'
  get 'final' => 'welcome#final'

  resources :transaction

end
