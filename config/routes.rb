Wiggles::Application.routes.draw do
  root to: 'wiggles#index'

  devise_for :users, :controllers => { :registrations => "users/registrations", :passwords => "users/passwords", :sessions => "users/sessions" }
  resources :wiggles do
    member do
      post   :like
      delete :like,     action: :unlike
      post   :dislike
      delete :dislike,  action: :undislike
      post   :bookmark
      delete :bookmark, action: :unbookmark
      post   :hide
      delete :hide,     action: :unhide
    end
  end
end
