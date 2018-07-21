class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :update, :destroy]

  def index
     @campaigns = Campaign.all

     render json: { satuts: 'SUCCESS', message: 'Campaigns Loaded', data: @campaigns }
  end

  def show
    if @campaign.enabled?
     #if Date.today < @campaign.end_time?
     render json: { message: 'Loaded Campaign', data: @campaign }, status: :ok
    else
     render json: { message: 'Campaign has ended' }
    end
  end

  def create
     @campaign = Campaign.new(campaign_params)
    if @campaign.save
       render json: { message: 'Campaign saved', data: @campaign }, status: :ok
    else
       render json: { message: 'Campaign not saved', data: @campaign.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @campaign.update(campaign_params)
       render json: { message: 'Campaign updated', data: @campaign }, status: :ok
    else
       render json: { message: 'Campaign not updated', data: @campaign.errors }, status: :unprocessable_entity
    end
  end

  def destroy
     @campaign.destroy
     render json: { message: 'Campaign deleted', data: @campaign }, status: :ok
  end

  private

    def find_campaign
       @campaign = Campaign.find(params[:id])
    end

    def campaign_params
       params.require(:campaign).permit(:name, :description, :start_time, :end_time, :enabled, :beacon_id)
    end
end
