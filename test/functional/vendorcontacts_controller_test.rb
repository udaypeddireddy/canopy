require 'test_helper'

class VendorcontactsControllerTest < ActionController::TestCase
  setup do
    @vendorcontact = vendorcontacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendorcontacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendorcontact" do
    assert_difference('Vendorcontact.count') do
      post :create, vendorcontact: { phone: @vendorcontact.phone, phone_extension: @vendorcontact.phone_extension, poc_alternate_email: @vendorcontact.poc_alternate_email, poc_email: @vendorcontact.poc_email, poc_name: @vendorcontact.poc_name, sub_sign_authority: @vendorcontact.sub_sign_authority, sub_sign_authority_title: @vendorcontact.sub_sign_authority_title, vendor_id: @vendorcontact.vendor_id }
    end

    assert_redirected_to vendorcontact_path(assigns(:vendorcontact))
  end

  test "should show vendorcontact" do
    get :show, id: @vendorcontact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendorcontact
    assert_response :success
  end

  test "should update vendorcontact" do
    put :update, id: @vendorcontact, vendorcontact: { phone: @vendorcontact.phone, phone_extension: @vendorcontact.phone_extension, poc_alternate_email: @vendorcontact.poc_alternate_email, poc_email: @vendorcontact.poc_email, poc_name: @vendorcontact.poc_name, sub_sign_authority: @vendorcontact.sub_sign_authority, sub_sign_authority_title: @vendorcontact.sub_sign_authority_title, vendor_id: @vendorcontact.vendor_id }
    assert_redirected_to vendorcontact_path(assigns(:vendorcontact))
  end

  test "should destroy vendorcontact" do
    assert_difference('Vendorcontact.count', -1) do
      delete :destroy, id: @vendorcontact
    end

    assert_redirected_to vendorcontacts_path
  end
end
