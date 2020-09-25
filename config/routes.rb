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
    resources :coverholders
  end
end
