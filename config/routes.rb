Rails.application.routes.draw do
  devise_for :deligated_authorities, controllers: {
      sessions:      'devise/deligated_authorities/sessions',
      masquerades:   'devise/deligated_authorities/masquerades',
      registrations: 'devise/deligated_authorities/registrations',
      passwords:     'devise/deligated_authorities/passwords',
      confirmations: 'devise/deligated_authorities/confirmations',
      unlocks:       'devise/deligated_authorities/unlocks'
  }

  devise_for :underwriters, controllers: {
      sessions:      'devise/underwriters/sessions',
      masquerades:   'devise/underwriters/masquerades',
      registrations: 'devise/underwriters/registrations',
      passwords:     'devise/underwriters/passwords',
      confirmations: 'devise/underwriters/confirmations',
      unlocks:       'devise/underwriters/unlocks'
  }

  root to: 'front#index'

  namespace :da do
    root to: 'dashboard#index'
  end

  namespace :uw do
    root to: 'dashboard#index'
    resources :coverholders, only: [:show, :new, :update, :edit, :destroy, :create] do
      resource  :registered_address, only: [:new, :show, :update, :create]
      resources :trading_location_addresses, only: [:index, :update, :create, :destroy]
      resources :deals, only: [:create] do
        member do
          get 'overview'
          get 'general-info'
          get 'contract-details'
          get 'icra'
        end
      end
    end
  end
end
