Weowe::Application.routes.draw do
  resources :dealers

  resources :weowe_forms

  devise_for :users
  root 'static_pages#dashboard'

  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'
  match '/dashboard', to: 'static_pages#dashboard', via: 'get'

end
