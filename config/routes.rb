Qrtura::Application.routes.draw do
  root to: 'welcome#index'
  resources :pages, only: :show

  get 'admin' => "admin/sessions#new"
  namespace :admin do
    resource :sessions, only: [ :new, :create, :destroy ]
    resources :pages
  end
end
