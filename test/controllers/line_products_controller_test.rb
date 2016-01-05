require 'test_helper'

class LineProductsControllerTest < ActionController::TestCase
  setup do
    @line_product = line_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_product" do
    assert_difference('LineProduct.count') do
      post :create, line_product: { cart_id: @line_product.cart_id, product_id: @line_product.product_id }
    end

    assert_redirected_to line_product_path(assigns(:line_product))
  end

  test "should show line_product" do
    get :show, id: @line_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_product
    assert_response :success
  end

  test "should update line_product" do
    patch :update, id: @line_product, line_product: { cart_id: @line_product.cart_id, product_id: @line_product.product_id }
    assert_redirected_to line_product_path(assigns(:line_product))
  end

  test "should destroy line_product" do
    assert_difference('LineProduct.count', -1) do
      delete :destroy, id: @line_product
    end

    assert_redirected_to line_products_path
  end
end
