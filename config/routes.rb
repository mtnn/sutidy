Rails.application.routes.draw do

  scope module: :publics do
    root to: 'homes#top'
    post '/' => 'homes#create'

    get 'users/mypage' => 'users#mypage'
    post 'users/mypage' => 'users#create'
    delete 'users/mypage/:id' => 'users#destroy', as: "outside_item_destroy"
    patch 'users/mypage/:id' => 'users#change_sub_priority', as: "change_subscribed_priority"
    patch 'users/mypage/:id' => 'users#change_out_priority', as: "change_outside_priority"

    get 'users/profile' => 'users#profile'
    get 'users/profile/edit' => 'users#edit'
    patch 'users/profile' => 'users#update'

    get 'clients/mypage' => 'clients#mypage'
    get 'clients/analytics/:id', to: 'clients#show', as: 'clients_analytics'
    patch 'clients/analytics/:id', to: 'clients#update', as: 'update_status'
    delete 'clients/analytics/:id' => 'clients#destroy', as: "destroy_subscribed_item"

    resources :services ,only: [:index, :show, :new, :create, :edit, :update] do
      collection do
        post 'services' => 'services#subscribe', as: 'new_subscribe'
        patch 'services/:id' => 'services#unsubscribe', as: 'unsubscribe'
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
