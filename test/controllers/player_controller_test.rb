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

  test "should get json response for show" do
    sign_in @user
    xhr :get, :show, deck_id: @deck, format: :json
    assert_response :success
    card = JSON.parse(response.body)
    assert_not_nil card[:name]
  end

end
