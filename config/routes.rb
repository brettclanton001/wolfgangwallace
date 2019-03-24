Rails.application.routes.draw do

  root to: 'public#home'
  get '/music', to: 'public#music'
  get '/videos', to: 'public#videos'
  get '/schedule', to: 'public#schedule'
  get '/contact', to: 'public#contact'

end
