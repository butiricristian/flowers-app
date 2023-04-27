Rails.application.routes.draw do
  resources :orders
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :orders, only: %i[index create update]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
