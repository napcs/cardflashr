require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  test "can create without category and desc if not sharing" do
    deck = Deck.create name: "My deck"
    assert deck.save
  end

  test "must have name" do
    deck = Deck.new
    deck.valid?
    assert deck.errors[:name].include? "can't be blank"
  end

  test "find shared" do
    assert_difference 'Deck.shared.count', 1 do
      deck = Deck.create name: "My deck", description: "Wat", category: Category.first
      deck.share
      deck.save
    end
  end

  test "is shared" do

    deck = Deck.create name: "My deck", description: "Wat", category: Category.first
    deck.share
    deck.save

    assert_not_nil deck.slug
    assert_not_nil deck.published_at
  end

  test "is unsharable" do
    deck = Deck.create name: "My deck", description: "Wat", category: Category.first
    deck.share
    deck.save

    deck.unshare

    assert_nil deck.slug
    assert_nil deck.published_at

  end


  test "can't share deck without description and category" do

    deck = Deck.create name: "My deck"
    deck.save

    deck.share
    deck.valid?
    assert deck.errors["description"].include? "must be filled in to share"
    assert deck.errors["category_id"].include? "must be filled in to share"

  end


  test "clone to user" do

    card = cards(:one)
    deck = card.deck
    deck.share
    deck.save
    user = deck.user

    new_deck = deck.clone_to_user user

    assert new_deck.persisted?

    assert new_deck.name == deck.name

    assert new_deck.cards.count == deck.cards.count

    assert !new_deck.shared
  end
end
