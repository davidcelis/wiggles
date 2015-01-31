require 'test_helper'

class WigglesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wiggles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wiggle" do
    assert_difference('Wiggle.count') do
      post :create, :wiggle => { }
    end

    assert_redirected_to wiggle_path(assigns(:wiggle))
  end

  test "should show wiggle" do
    get :show, :id => wiggles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wiggles(:one).to_param
    assert_response :success
  end

  test "should update wiggle" do
    put :update, :id => wiggles(:one).to_param, :wiggle => { }
    assert_redirected_to wiggle_path(assigns(:wiggle))
  end

  test "should destroy wiggle" do
    assert_difference('Wiggle.count', -1) do
      delete :destroy, :id => wiggles(:one).to_param
    end

    assert_redirected_to wiggles_path
  end
end
