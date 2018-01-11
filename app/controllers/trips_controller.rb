class TripsController < ApplicationController
  before_action :set_trip, only: [:show]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    packing_list = PackingList.create({name: "My Packing List"})
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.packing_list = packing_list

    if @trip.save
      redirect_to trip_path @trip.id
    else
      redirect_to :new
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :duration, :start_date)
  end
end
