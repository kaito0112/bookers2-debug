Rails.application.routes.draw do
  get "relationships/followings"
  get "relationships/followers"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  get "/search" => "searches#search"

  get "messages/:id" => "messages#message", as: "message"
  post "messages" => "messages#create", as: "messages"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
