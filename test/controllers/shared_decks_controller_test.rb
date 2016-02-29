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

end
