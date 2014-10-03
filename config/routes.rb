Weowe::Application.routes.draw do
  resources :demos

  devise_for :users

  resources :dealers
  resources :weowe_forms
  resources :users
  resources :charges

  root 'static_pages#landing_page'

  match '/dashboard', to: 'weowe_forms#dashboard', via: 'get'

  match '/approve_form', to: 'weowe_forms#approve_form', via: 'post'
  match '/complete_form', to: 'weowe_forms#complete_form', via: 'post'

  match '/pending', to: 'weowe_forms#pending',    via: 'get'
  match '/completed', to: 'weowe_forms#completed',    via: 'get'

  match '/metrics', to: 'weowe_forms#metrics', via: 'get'

  match '/admin', to: 'dealers#admin',    via: 'get'

  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/tos', to: 'static_pages#tos', via: 'get'

  match '/stats',
        to: 'static_pages#stats',
        via: 'get'
  match '/stats',
        to: 'static_pages#stats',
        via: 'post'

  match '/about', to: 'static_pages#about',    via: 'get'

  match '/landing_page', to: 'static_pages#landing_page',    via: 'get'
  match '/tour', to: 'static_pages#tour',    via: 'get'
end
