Weowe::Application.routes.draw do
  devise_for :users

  resources :dealers
  resources :weowe_forms
  resources :users

<<<<<<< HEAD
  root :to => "static_pages#dashboard"

  get 'users/help'
=======
  devise_for :users
  root 'static_pages#dashboard'

  get 'static_pages/help'
>>>>>>> 4e11a304e07d8f1821360321d38036c36f3c8fd8
  get 'static_pages/contact'
  get 'static_pages/about'
  match '/dashboard', to: 'static_pages#dashboard', via: 'get'

end
