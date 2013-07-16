FriendCircle::Application.routes.draw do
  resources :users
  resources :session
  resources :circles

  root to: "session#new"
end
