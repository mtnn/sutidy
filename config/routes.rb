Rails.application.routes.draw do

  namespace :publics do
    get 'services/index'
    get 'services/show'
    get 'services/update'
  end
  namespace :publics do
    get 'homes/top'
  end
  scope module: :publics do
    root to: 'homes#top'

    resources :services ,only: [:index, :show, :update]
  end

  namespace :admins do
  end

  devise_for :admins, :skip =>[:registrations, :passwords], controllers: {
    sessions: 'admins/sessions',
  }

  devise_for :users, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations',
  }

end
