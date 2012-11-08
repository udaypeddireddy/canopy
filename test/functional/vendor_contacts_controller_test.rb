require 'test_helper'

class VendorContactsControllerTest < ActionController::TestCase
  setup do
    @vendor_contact = vendor_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_contact" do
    assert_difference('VendorContact.count') do
      post :create, vendor_contact: { phone: @vendor_contact.phone, phone_extension: @vendor_contact.phone_extension, poc_alternate_email: @vendor_contact.poc_alternate_email, poc_email: @vendor_contact.poc_email, poc_name: @vendor_contact.poc_name, sub_sign_authority: @vendor_contact.sub_sign_authority, sub_sign_authority_title: @vendor_contact.sub_sign_authority_title, vendor_id: @vendor_contact.vendor_id }
    end

    assert_redirected_to vendor_contact_path(assigns(:vendor_contact))
  end

  test "should show vendor_contact" do
    get :show, id: @vendor_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_contact
    assert_response :success
  end

  test "should update vendor_contact" do
    put :update, id: @vendor_contact, vendor_contact: { phone: @vendor_contact.phone, phone_extension: @vendor_contact.phone_extension, poc_alternate_email: @vendor_contact.poc_alternate_email, poc_email: @vendor_contact.poc_email, poc_name: @vendor_contact.poc_name, sub_sign_authority: @vendor_contact.sub_sign_authority, sub_sign_authority_title: @vendor_contact.sub_sign_authority_title, vendor_id: @vendor_contact.vendor_id }
    assert_redirected_to vendor_contact_path(assigns(:vendor_contact))
  end

  test "should destroy vendor_contact" do
    assert_difference('VendorContact.count', -1) do
      delete :destroy, id: @vendor_contact
    end

    assert_redirected_to vendor_contacts_path
  end
end
