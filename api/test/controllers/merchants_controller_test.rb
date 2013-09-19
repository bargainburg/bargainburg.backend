require 'test_helper'

class MerchantsControllerTest < ActionController::TestCase
  setup do
    @merchant = merchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchants)
  end

  test "should create merchant" do
    assert_difference('Merchant.count') do
      post :create, merchant: { approved: @merchant.approved, description: @merchant.description, email: @merchant.email, hours: @merchant.hours, link: @merchant.link, name: @merchant.name, phone: @merchant.phone, price_range: @merchant.price_range }
    end

    assert_response 201
  end

  test "should show merchant" do
    get :show, id: @merchant
    assert_response :success
  end

  test "should update merchant" do
    put :update, id: @merchant, merchant: { approved: @merchant.approved, description: @merchant.description, email: @merchant.email, hours: @merchant.hours, link: @merchant.link, name: @merchant.name, phone: @merchant.phone, price_range: @merchant.price_range }
    assert_response 204
  end

  test "should destroy merchant" do
    assert_difference('Merchant.count', -1) do
      delete :destroy, id: @merchant
    end

    assert_response 204
  end
end
