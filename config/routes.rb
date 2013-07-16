FriendCircle::Application.routes.draw do
  resources :users
  resources :session


  root to: "session#new"
end
