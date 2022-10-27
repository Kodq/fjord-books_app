Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, :only => [:index, :show]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
