Rails.application.routes.draw do

  scope module: :publics do
    root to: 'homes#top'

    get 'users/mypage' => 'users#mypage'
    get 'users/mypage' => 'users#new_item'
    post 'users/mypage' => 'users#create'
    get 'users/mypage' => 'users#destroy'

    get 'users/profile' => 'users#profile'
    get 'users/profile/edit' => 'users#edit'
    patch 'users/profile' => 'users#update'
    get 'users/quit' => 'users#confirm'
    patch 'users/quit' => 'users#quit'

    resources :services ,only: [:index, :show, :update]
  end

  namespace :admins do
    resources :genres ,only: [:index, :edit, :update]
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
