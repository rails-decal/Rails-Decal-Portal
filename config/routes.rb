Rails.application.routes.draw do
  get 'attendances/index'

  get 'attendances/create'

  get 'attendances/new'

  get 'attendances/edit'

  get 'attendances/show'

  get 'attendances/update'

  get 'attendances/destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "semesters#index"

  resources :semesters do
    resources :weeks, only: [:create, :new, :edit, :update, :destroy]
    resources :assignments, only: [:index, :destroy]
  end

  resources :weeks do
    resources :assignments, only: [:create, :new, :edit, :update]
    resources :resources
  end

  resources :assignments do
    resources :submissions
  end

  resources :students do
    resources :attendances
  end

end
