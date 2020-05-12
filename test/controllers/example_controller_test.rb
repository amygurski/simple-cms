require 'test_helper'

class ExampleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get example_index_url
    assert_response :success
  end

  test "should get two" do
    get example_two_url
    assert_response :success
  end

  test "should get three" do
    get example_three_url
    assert_response :success
  end

end
