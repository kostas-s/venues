Rails
  .application
  .routes
  .draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :venues do
      resources :timeslots, only: %i[create destroy]
    end
    root 'venues#index'
  end
