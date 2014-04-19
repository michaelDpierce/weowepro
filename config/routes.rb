Weowe::Application.routes.draw do
  devise_for :users

  resources :dealers
  resources :weowe_forms
  resources :users
  resources :charges

  root 'weowe_forms#dashboard'

  match '/dashboard', to: 'weowe_forms#dashboard', via: 'get'

  match '/pending', to: 'weowe_forms#pending',    via: 'get'
  match '/completed', to: 'weowe_forms#completed',    via: 'get'

  match '/admin', to: 'dealers#admin',    via: 'get'

  match '/stats',
        to: 'static_pages#stats',
        via: 'get'
  match '/stats',
        to: 'static_pages#stats',
        via: 'post'

  match '/about', to: 'static_pages#about',    via: 'get'
end
