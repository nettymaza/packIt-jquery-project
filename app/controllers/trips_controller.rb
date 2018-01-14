class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update]

  def index
    if params[:user_id]
      @trips = Trip.find(params[:user_id])
    else
      @trips = Trip.all
    end
  end

  def show
    @item = @trip.items.build
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    if @trip.save
      redirect_to trip_path @trip.id
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Song.find(params[:id]).destroy
    redirect_to trips_path
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :duration, :start_date, :item_ids => [], items_attributes: [:name])
  end

end
