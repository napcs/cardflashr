require 'test_helper'

class DecksControllerTest < ActionController::TestCase
  setup do
    @deck = decks(:private)
    @user = @deck.user
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:decks)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create deck" do
    sign_in @user
    assert_difference('Deck.count') do
      post :create, deck: { description: @deck.description, name: @deck.name,  user_id: @deck.user_id }
    end

    assert_redirected_to deck_path(assigns(:deck))
  end

  test "should show deck" do
    sign_in @user
    get :show, id: @deck
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @deck
    assert_response :success
  end

  test "should update deck" do
    sign_in @user
    patch :update, id: @deck, deck: { description: @deck.description, name: @deck.name, user_id: @deck.user_id }
    assert_redirected_to deck_path(assigns(:deck))
  end

  test "should destroy deck" do
    sign_in @user
    assert_difference('Deck.count', -1) do
      delete :destroy, id: @deck
    end

    assert_redirected_to decks_path
  end
end
