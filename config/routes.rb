Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/curriculum/:semester_id', to: 'curriculums#index', as: 'view_curriculum'

  get '/curriculum/:semester_id/create/week', to: 'curriculums#show_week_creator'
  get '/curriculum/:semester_id/create/:week_number/resource', to: 'curriculums#show_resource_creator'

  post '/curriculum/:semester_id/create/week', to: 'curriculums#create_week', as: 'create_week'
  post '/curriculum/:semester_id/create/:week_id/resource', to: "curriculums#create_resource", as: 'create_resource'

  delete '/curriculum/destroy/week/:id', to: 'curriculums#destroy_week', as: 'destroy_week'
  delete '/curriculum/destroy/resource/:id', to: 'curriculums#destroy_resource', as: 'destroy_resource'
end
