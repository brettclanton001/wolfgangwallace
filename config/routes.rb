Rails.application.routes.draw do

  # Redirects
  get '/schedule', to: redirect('/shows')
  get '/admin', to: redirect('/admin/lore_pages')

  # Main
  root to: 'public#home'
  get '/music', to: 'public#music'
  get '/videos', to: 'public#videos'
  get '/shows', to: 'public#shows'
  get '/contact', to: 'public#contact'

  # Admin
  scope :admin do
    resources :lore_pages, as: :lore_pages
  end

  devise_for :users

end
