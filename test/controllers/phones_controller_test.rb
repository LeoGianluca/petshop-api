require "test_helper"

class PhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:one)
  end

  test "should get index" do
    get phones_url, as: :json
    assert_response :success
  end

  test "should create phone" do
    assert_difference("Phone.count") do
      post phones_url, params: { phone: { number: @phone.number, people_id: @phone.people_id } }, as: :json
    end

    assert_response :created
  end

  test "should show phone" do
    get phone_url(@phone), as: :json
    assert_response :success
  end

  test "should update phone" do
    patch phone_url(@phone), params: { phone: { number: @phone.number, people_id: @phone.people_id } }, as: :json
    assert_response :success
  end

  test "should destroy phone" do
    assert_difference("Phone.count", -1) do
      delete phone_url(@phone), as: :json
    end

    assert_response :no_content
  end
end
