Rails.application.routes.draw do

  # Redirects
  get '/schedule', to: redirect('/shows')

  # Main
  root to: 'public#home'
  get '/music', to: 'public#music'
  get '/videos', to: 'public#videos'
  get '/shows', to: 'public#shows'
  get '/contact', to: 'public#contact'

end
