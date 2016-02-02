class PlayerController < ApplicationController
  before_action :authenticate_user!

  def show
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards.page(params[:page]).per(1)
    @card = @cards.first
  end

end
