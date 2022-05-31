Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pokemones#index'
  resources :pokemones do
    get '/page/:page', action: :index, on: :collection
  end
  get '/no_data', to: 'pokemones#no_data'
  get '/detalles/:id', to: 'pokemones#detalles'
end
