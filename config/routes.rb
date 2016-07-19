Rails.application.routes.draw do

  get 'movies/index'

  get 'movies/show'

  get 'movies/new'

  get 'movies/edit'

  get 'movies', to: 'movies#index'

end
