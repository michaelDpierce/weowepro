Weowe::Application.routes.draw do
  devise_for :users

  resources :dealers
  resources :weowe_forms
  resources :users

  root 'static_pages#dashboard'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'
  match '/dashboard', to: 'static_pages#dashboard', via: 'get'

end
