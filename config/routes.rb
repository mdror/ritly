Ritly::Application.routes.draw do

  root "urls#new"
        resources :urls, only: [:new, :create, :show] #ToDo: restrict this to just :create, :new and :show

        get '/:hash_code', to: 'urls#redirector'
        get '/:hash_code/preview', to: 'urls#preview'
  end

  