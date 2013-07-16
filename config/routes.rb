FriendCircle::Application.routes.draw do
  resources :users
  resources :session
  resources :circles
  resources :posts

  root to: "session#new"
end
