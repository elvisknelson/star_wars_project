Rails.application.routes.draw do
  get 'starships/index'
  get 'starships/show'
  root to: 'characters#index'

  get 'search/index'

  get 'about', to: 'about#index'

  get 'characters', to: 'characters#index'
  resources 'characters', only: %i[index show]

  get 'homeworlds', to: 'homeworlds#index'
  resources 'homeworlds', only: %i[index show]

  get 'speciess', to: 'species#index'
  resources 'species', only: %i[index show]

  get 'starships', to: 'starships#index'
  resources 'starships', only: %i[index show]
end
