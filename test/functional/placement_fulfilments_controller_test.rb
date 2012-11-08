require 'test_helper'

class PlacementFulfilmentsControllerTest < ActionController::TestCase
  setup do
    @placement_fulfilment = placement_fulfilments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placement_fulfilments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create placement_fulfilment" do
    assert_difference('PlacementFulfilment.count') do
      post :create, placement_fulfilment: { client_id: @placement_fulfilment.client_id, consultant_id: @placement_fulfilment.consultant_id, recruiter_id: @placement_fulfilment.recruiter_id, salesperson_id: @placement_fulfilment.salesperson_id, user_acceptance: @placement_fulfilment.user_acceptance, user_acceptance_timestamp: @placement_fulfilment.user_acceptance_timestamp, vendor_id: @placement_fulfilment.vendor_id }
    end

    assert_redirected_to placement_fulfilment_path(assigns(:placement_fulfilment))
  end

  test "should show placement_fulfilment" do
    get :show, id: @placement_fulfilment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @placement_fulfilment
    assert_response :success
  end

  test "should update placement_fulfilment" do
    put :update, id: @placement_fulfilment, placement_fulfilment: { client_id: @placement_fulfilment.client_id, consultant_id: @placement_fulfilment.consultant_id, recruiter_id: @placement_fulfilment.recruiter_id, salesperson_id: @placement_fulfilment.salesperson_id, user_acceptance: @placement_fulfilment.user_acceptance, user_acceptance_timestamp: @placement_fulfilment.user_acceptance_timestamp, vendor_id: @placement_fulfilment.vendor_id }
    assert_redirected_to placement_fulfilment_path(assigns(:placement_fulfilment))
  end

  test "should destroy placement_fulfilment" do
    assert_difference('PlacementFulfilment.count', -1) do
      delete :destroy, id: @placement_fulfilment
    end

    assert_redirected_to placement_fulfilments_path
  end
end
