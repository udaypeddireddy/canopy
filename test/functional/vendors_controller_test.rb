require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor" do
    assert_difference('Vendor.count') do
      post :create, vendor: { address1: @vendor.address1, address2: @vendor.address2, city: @vendor.city, fax: @vendor.fax, federa_id: @vendor.federa_id, name: @vendor.name, parent_id: @vendor.parent_id, state: @vendor.state, zip: @vendor.zip }
    end

    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should show vendor" do
    get :show, id: @vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor
    assert_response :success
  end

  test "should update vendor" do
    put :update, id: @vendor, vendor: { address1: @vendor.address1, address2: @vendor.address2, city: @vendor.city, fax: @vendor.fax, federa_id: @vendor.federa_id, name: @vendor.name, parent_id: @vendor.parent_id, state: @vendor.state, zip: @vendor.zip }
    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete :destroy, id: @vendor
    end

    assert_redirected_to vendors_path
  end
end
