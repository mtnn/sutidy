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

    get 'clients/mypage' => 'clients#mypage'
    get 'clients/analytics/:id' => 'clients#show'
    get 'clients/analytics/:id' => 'clients#edit'
    patch 'clients/analytics' => 'clients#update'

    resources :services ,only: [:index, :show, :new, :create, :edit, :update] do
      collection do
        post 'services' => 'services#subscribe', as: 'new_subscribe'
      end
    end

  end

  namespace :admins do
    resources :services, only: [:index, :update, :destroy]
    resources :genres ,only: [:index, :create, :destroy]
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
