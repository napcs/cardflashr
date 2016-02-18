Rails.application.routes.draw do

  resources :categories

  get 'player/:deck_id' => 'player#show', as: "player"

  resources :decks do
    resources :cards
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'home#index'

end
