Weowe::Application.routes.draw do
  devise_for :users

  resources :dealers
  resources :weowe_forms
  resources :users

  root 'static_pages#dashboard'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'
  match '/dashboard',          to: 'weowe_forms#dashboard', via: 'get'

  match '/pending', to: 'weowe_forms#pending',    via: 'get'
  match '/completed', to: 'weowe_forms#completed',    via: 'get'

  match '/stats', to: 'static_pages#stats',    via: 'get'

end
