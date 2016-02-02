require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  setup do
    @card = cards(:one)
    @deck = @card.deck
    @user = @deck.user
  end

  test "should get index" do
    sign_in @user
    get :index, {deck_id: @deck}
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  test "should get new" do
    sign_in @user
    get :new, {deck_id: @deck}
    assert_response :success
  end

  test "should create card" do
    sign_in @user
    assert_difference('Card.count') do
      post :create, deck_id: @deck, card: { answer_text: @card.answer_text, deck_id: @card.deck_id, name: @card.name, question_text: @card.question_text }
    end

    assert_redirected_to deck_cards_path(@deck)
  end

  test "should show card" do
    sign_in @user
    get :show, deck_id: @deck, id: @card
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, deck_id: @deck, id: @card
    assert_response :success
  end

  test "should update card" do
    sign_in @user
    patch :update, deck_id: @deck, id: @card, card: { answer_text: @card.answer_text, deck_id: @card.deck_id, name: @card.name, question_text: @card.question_text }
    assert_redirected_to deck_card_path(@deck, assigns(:card))
  end

  test "should destroy card" do
    sign_in @user
    assert_difference('Card.count', -1) do
      delete :destroy, deck_id: @deck, id: @card
    end

    assert_redirected_to deck_cards_path(@deck)
  end
end
