require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get campaigns_url, as: :json
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { beacon_id: @campaign.beacon_id, description: @campaign.description, enabled: @campaign.enabled, end_time: @campaign.end_time, name: @campaign.name, start_time: @campaign.start_time } }, as: :json
    end

    assert_response 201
  end

  test "should show campaign" do
    get campaign_url(@campaign), as: :json
    assert_response :success
  end

  test "should update campaign" do
    patch campaign_url(@campaign), params: { campaign: { beacon_id: @campaign.beacon_id, description: @campaign.description, enabled: @campaign.enabled, end_time: @campaign.end_time, name: @campaign.name, start_time: @campaign.start_time } }, as: :json
    assert_response 200
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign), as: :json
    end

    assert_response 204
  end
end
