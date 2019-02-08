Rails.application.routes.draw do
  get 'employees/index'
  get 'employees/json/:id/', to: 'employees#showAssistants'

  resources :employees

  root 'employees#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
