class PlayerController < ApplicationController
  before_action :authenticate_user!

  def show
    @card_index = 0
    @deck = Deck.find(params[:deck_id])
    if params[:card]
      @card_index = params[:card].to_i
    else
      @cards = @deck.cards
      session[:cards] = @cards.collect{|c| c.id}.shuffle
    end
    @card = @deck.cards.find session[:cards][@card_index]
  end


end
