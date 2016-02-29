class HomeController < ApplicationController
  def index
    @recent_deck = Deck.shared.order("published_at DESC").first
  end
end
