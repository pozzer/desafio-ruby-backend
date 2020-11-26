Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'import' =>'imports#import', as: :import

  resources :stores, only: [:index] do
    resources :transactions, only: [:index]
  end

  root 'stores#index'
end
