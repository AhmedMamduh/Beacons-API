class BeaconsController < ApplicationController
  before_action :find_beacon, only: [:show, :update, :destroy]

  def index
    @beacons = Beacon.all
    render json: { satuts: 'SUCCESS', message: 'Beacons Loaded', data: @beacons }
  end

  def show
    if @campaign.enabled?
    render json: { message: 'Campaign loaded for your beacon', data: @campaign }, status: :ok
    else
    render json: {message: 'Campaign has ended'}
    end
  end

  def create
    @beacon = Beacon.new(beacon_params)
    if @beacon.save
      render json: { message: 'Beacon saved', data: @beacon }, status: :ok
    else
      render json: { message: 'Beacon not saved', data: @beacon.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @beacon.update(beacon_params)
       render json: { message: 'Beacon updated', data: @beacon }, status: :ok
    else
       render json: { message: 'Beacon not updated', data: @beacon.errors }, status: :unprocessable_entity
    end
  end

  def destroy
      @beacon.destroy
      render json: { message: 'Beacon deleted', data: @beacon }, status: :ok
  end

  private

    def find_beacon
      @beacon = Beacon.find_by_major_and_minor(params[:major], params[:minor])
      @campaign = Campaign.find_by_beacon_id(@beacon)
    end

    def beacon_params
       params.require(:beacon).permit(:name, :major, :minor)
    end
end
