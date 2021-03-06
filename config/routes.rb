Rails.application.routes.draw do
  post '/charges/:id', to: 'charges#charge', as: 'charges_payment'
  resources :charges
  devise_for :users
    resources :items do
    member do
      resource :charge
    end
  end
  root to: "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
