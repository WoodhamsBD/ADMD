Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'
  get '/calendar', to: 'static_pages#calendar'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]

  # Need Routes for all models 

  #Patient
  resources :patients do
    resources :appointments, only: [:index, :show, :new, :create]
    # Templates
    # Allows for /patient/:id/XXX XXX = Template name
    get :appointment_confirmation, format: 'docx'

  end

  #Appointment
  resources :appointments

  #Attorney
  resources :attorneys

  #Adjuster
  #resources :adjuster

end