require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

  test "should get comp" do
    get :comp
    assert_response :success
  end

end
