Rails.application.routes.draw do
  devise_for :admins
  devise_for :students

  mount RailsAdmin::Engine => '/config', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "semesters#latest"

  get 'sign_out', to: 'login#sign_out'
  get 'edit_profile', to: 'login#edit_profile'
  post 'activate_semester', to: 'semesters#activate'

  resources :semesters do
    resources :weeks, only: [:create, :new, :edit, :update, :destroy]
    resources :assignments, only: [:index, :destroy, :create]
    resources :submissions, only: [:index]
    resources :students, only: [:index, :show]
    resources :attendances, only: [:index, :create, :update]
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
