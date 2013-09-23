require 'test_helper'

class PointOfContactsControllerTest < ActionController::TestCase
  setup do
    @point_of_contact = point_of_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_of_contacts)
  end

  test "should create point_of_contact" do
    assert_difference('PointOfContact.count') do
      post :create, point_of_contact: { email: @point_of_contact.email, name: @point_of_contact.name, password: @point_of_contact.password, phone: @point_of_contact.phone }
    end

    assert_response 201
  end

  test "should show point_of_contact" do
    get :show, id: @point_of_contact
    assert_response :success
  end

  test "should update point_of_contact" do
    put :update, id: @point_of_contact, point_of_contact: { email: @point_of_contact.email, name: @point_of_contact.name, password: @point_of_contact.password, phone: @point_of_contact.phone }
    assert_response 204
  end

  test "should destroy point_of_contact" do
    assert_difference('PointOfContact.count', -1) do
      delete :destroy, id: @point_of_contact
    end

    assert_response 204
  end
end
