Rails.application.routes.draw do
  devise_scope :admin do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_admin_registration" # custom path to sign_up/registration
  end

  devise_for :admins, :skip => [:registrations]
    as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

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

  resources :admins, only: [:index]
  get '/grading', to: 'admins#grading'

  resources :weeks do
    resources :assignments, only: [:create, :edit, :update]
    resources :resources
    resources :attendances, only: [:create]
  end

  resources :assignments do
    resources :submissions, only: [:create, :update, :destroy]
  end

  resources :submissions, only: [:update]

  # TODO: Look up rails conventions when it comes to nested resources vs....non-nested resources

  get 'json', to: 'semesters#json'


end
