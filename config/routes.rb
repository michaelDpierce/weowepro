Weowe::Application.routes.draw do
  devise_for :users

  resources :demos
  resources :dealers
  resources :weowe_forms
  resources :users

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

  match '/staff', to: 'static_pages#staff',    via: 'get'
  match '/overall', to: 'static_pages#overall',    via: 'get'

  match '/landing_page', to: 'static_pages#landing_page',    via: 'get'
end
