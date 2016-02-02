require 'test_helper'

class CardTest < ActiveSupport::TestCase
  test "must have name" do
    card = Card.new
    card.valid?
    assert card.errors[:name].include? "can't be blank"
  end
end
