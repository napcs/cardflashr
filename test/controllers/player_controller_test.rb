require 'test_helper'

class PlayerControllerTest < ActionController::TestCase
  setup do
    @deck = decks(:private)
    @user = @deck.user
  end

  test "should get show" do
    sign_in @user
    get :show, deck_id: @deck
    assert_response :success
  end

end
