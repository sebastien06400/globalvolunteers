Rails.application.routes.draw do


  devise_for :users, skip: [:registrations]
  devise_scope :user do

    put    '/account',  to: 'devise/registrations#update'
    post   '/account',  to: 'devise/registrations#create'
    get    '/register', to: 'devise/registrations#new',    as: :new_user_registration
    get    '/account',  to: 'devise/registrations#edit',   as: :edit_user_registration
    patch  '/account',  to: 'users#update', as: :user_registration
    get    '/account/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration

  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :missions, only: [:index, :show, :new, :create, :destroy] do
    # collection do
    #   get :profile
    # end
    resources :participations, only: [:create, :destroy]
  end
end

