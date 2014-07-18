require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "homes#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show], id: /[^\/]+/ do
    member do
      post "follow", to: "following_relationships#create"
      delete "follow", to: "following_relationships#destroy"
    end
  end

  resources :text_shouts, only: [:create]
  resources :image_shouts, only: [:create]

  get :search, to: "search_results#show"
end
