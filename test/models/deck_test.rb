require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  test "must have name" do
    deck = Deck.new
    deck.valid?
    assert deck.errors[:name].include? "can't be blank"
  end
end
