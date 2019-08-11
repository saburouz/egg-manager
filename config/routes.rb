Rails.application.routes.draw do
  get 'results/show'
  get 'results/new'
  get 'results/create'
  get 'results/update'
  get 'results/edit'
  get 'results/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :lots, only: [:index, :show, :new, :create, :update, :edit ] do
    member do
      get 'graph'
    end
  end
  resources :results, only:[:show, :new, :create, :update, :edit, :delete]
end
