require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:math)
    @user = User.first
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create category" do
    sign_in @user
    assert_difference('Category.count') do
      post :create, category: { name: @category.name }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    sign_in @user
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    sign_in @user
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    sign_in @user
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
