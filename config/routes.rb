Rails.application.routes.draw do
  root to: 'characters#index'

  get 'characters', to: 'characters#index'
  resources 'characters', only: %i[index show]

  get 'homeworlds', to: 'homeworlds#index'
  resources 'homeworlds', only: %i[index show]

  get 'speciess', to: 'species#index'
  resources 'species', only: %i[index show]
end
