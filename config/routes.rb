Rails.application.routes.draw do
  get 'employees/show'
  get 'employees/json/:id/', to: 'employees#showAssistants'

  resources :employees

  root 'employees#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
