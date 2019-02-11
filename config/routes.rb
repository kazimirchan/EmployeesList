Rails.application.routes.draw do
  get 'employees', to: redirect('employees/show')
  get 'employees/show'
  get 'employees/json/:id/', to: 'employees#showAssistants'

  resources :employees, only: [:show]

  root 'employees#show'

  get "/employees/:id/(*url)", to: redirect('/404')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
