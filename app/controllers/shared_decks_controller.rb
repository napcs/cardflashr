class SharedDecksController < ApplicationController
  def index
    @decks = Deck.shared
  end

  def show
    @deck = Deck.find_by_slug params[:id]
  end
end
