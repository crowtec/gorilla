Rails.application.routes.draw do
  root 'welcome#index'
  get 'verify' => 'welcome#verify'

end
