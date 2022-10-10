Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, :only => [:index, :show]
  #devise_for :users, :controllers => {
    #:sessions      => "users/sessions",
    #:registrations => "users/registrations",
    #:passwords     => "users/passwords",
  #}
  #resources :users, :only => [:index, :show]
  # ・・・
  #get 'users/index'
  #get 'users/show'
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
