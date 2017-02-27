Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :products do
    resources :reviews
  end

  root to: 'home#index'
end
