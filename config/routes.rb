Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "semesters#index"

  resources :semesters do
    resources :weeks, only: [:create, :new, :edit, :update, :destroy]
    resources :assignments, only: [:index, :destroy]
  end

  resources :weeks do
    resources :assignments, only: [:create, :new, :edit, :update]
  end

  resources :assignments do
    resources :submissions
  end
end
