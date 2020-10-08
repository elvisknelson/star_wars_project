Rails.application.routes.draw do
  root to: 'characters#index'
  get 'characters/show'
end
