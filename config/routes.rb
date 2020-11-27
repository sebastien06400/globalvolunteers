Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :missions, only: [:index, :show, :new, :create, :destroy] do
    # collection do
    #   get :profile
    # end
    resources :participations, only: [:create, :destroy]
  end
end

