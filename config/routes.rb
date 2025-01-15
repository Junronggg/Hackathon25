Rails.application.routes.draw do
  get 'home', to: 'dishes#home'
  get 'random', to: 'dishes#random'
  get 'by_ingredients', to: 'dishes#by_ingredients'
  root 'dishes#home' # Redirect root to /home
end
