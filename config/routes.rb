Rails.application.routes.draw do

  get 'shared_decks/', to: 'shared_decks#index'
  get 'shared_decks/:id', to: 'shared_decks#show', as: :shared_deck
  post 'shared_decks/:id/clone', to: 'shared_decks#clone', as: :clone_shared_deck

  resources :categories

  get 'player/:deck_id' => 'player#show', as: "player"

  resources :decks do
    member do
      patch :share
      patch :unshare
    end
    resources :cards
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'home#index'

end
