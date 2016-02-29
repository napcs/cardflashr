class SharedDecksController < ApplicationController

  before_action :authenticate_user!, only: [:clone]

  def index
    @decks = Deck.shared
  end

  def show
    @deck = Deck.find_by_slug params[:id]
  end

  def clone
    @deck = Deck.find_by_slug params[:id]
    new_deck = @deck.clone_to_user current_user
    redirect_to deck_path(new_deck), notice: "Enjoy your new deck."
  end
end
