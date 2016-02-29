require 'test_helper'

class SharedDecksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    deck = Deck.create name: "My deck", description: "Wat", category: Category.first
    deck.share
    deck.save

    get :show, id: deck.slug
    assert_response :success
  end

  test "clone a deck" do
    card = cards(:one)
    deck = card.deck
    deck.share
    deck.save
    user = deck.user
    sign_in user

    post :clone, id: deck.slug

    assert_response :redirect

  end

end
