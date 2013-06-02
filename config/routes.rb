Wiggles::Application.routes.draw do
  root to: 'wiggles#index'

  devise_for :users, :controllers => { :registrations => "users/registrations", :passwords => "users/passwords", :sessions => "users/sessions" }
  resources :wiggles
end
