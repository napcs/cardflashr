class PlayerController < ApplicationController
  def show
    @deck = Deck.where(shared: true).find(params[:deck_id])
    @cards = @deck.cards.page(params[:page]).per(1)
    @card = @cards.first
  end
end
