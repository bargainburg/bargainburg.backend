require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  setup do
    @coupon = coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupons)
  end

  test "should create coupon" do
    assert_difference('Coupon.count') do
      post :create, coupon: { begin_date: @coupon.begin_date, created_date: @coupon.created_date, description: @coupon.description, end_date: @coupon.end_date, hidden: @coupon.hidden, image: @coupon.image, name: @coupon.name }
    end

    assert_response 201
  end

  test "should show coupon" do
    get :show, id: @coupon
    assert_response :success
  end

  test "should update coupon" do
    put :update, id: @coupon, coupon: { begin_date: @coupon.begin_date, created_date: @coupon.created_date, description: @coupon.description, end_date: @coupon.end_date, hidden: @coupon.hidden, image: @coupon.image, name: @coupon.name }
    assert_response 204
  end

  test "should destroy coupon" do
    assert_difference('Coupon.count', -1) do
      delete :destroy, id: @coupon
    end

    assert_response 204
  end
end
