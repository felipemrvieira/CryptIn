require "test_helper"

class TransitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transition = transitions(:one)
  end

  test "should get index" do
    get transitions_url, as: :json
    assert_response :success
  end

  test "should create transition" do
    assert_difference("Transition.count") do
      post transitions_url, params: { transition: { account_id: @transition.account_id, amount: @transition.amount } }, as: :json
    end

    assert_response :created
  end

  test "should show transition" do
    get transition_url(@transition), as: :json
    assert_response :success
  end

  test "should update transition" do
    patch transition_url(@transition), params: { transition: { account_id: @transition.account_id, amount: @transition.amount } }, as: :json
    assert_response :success
  end

  test "should destroy transition" do
    assert_difference("Transition.count", -1) do
      delete transition_url(@transition), as: :json
    end

    assert_response :no_content
  end
end
