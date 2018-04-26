Rails.application.routes.draw do
  devise_for :admins
  devise_for :students

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "semesters#index"

  get 'sign_in', to: 'login#sign_in'
  get 'sign_out', to: 'login#sign_out'
  get 'edit_profile', to: 'login#edit_profile'

  resources :semesters do
    resources :weeks, only: [:create, :new, :edit, :update, :destroy]
    resources :assignments, only: [:index, :destroy, :create]
    resources :submissions, only: [:index]
    resources :students, only: [:index]
    resources :attendances, only: [:index, :create]
  end

  resources :weeks do
    resources :assignments, only: [:create, :edit, :update]
    resources :resources
    resources :attendances, only: [:create]
  end

  resources :assignments do
    resources :submissions, only: [:create, :update, :destroy]
  end

  resources :submissions, only: [:update]

end
