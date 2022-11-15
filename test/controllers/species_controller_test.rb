require "test_helper"

class SpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @species = species(:one)
  end

  test "should get index" do
    get species_index_url, as: :json
    assert_response :success
  end

  test "should create species" do
    assert_difference("Species.count") do
      post species_index_url, params: { species: { description: @species.description } }, as: :json
    end

    assert_response :created
  end

  test "should show species" do
    get species_url(@species), as: :json
    assert_response :success
  end

  test "should update species" do
    patch species_url(@species), params: { species: { description: @species.description } }, as: :json
    assert_response :success
  end

  test "should destroy species" do
    assert_difference("Species.count", -1) do
      delete species_url(@species), as: :json
    end

    assert_response :no_content
  end
end
