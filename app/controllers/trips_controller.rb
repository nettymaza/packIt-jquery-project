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
        @trip = Trip.new(trip_params)
        if @trip.save
            redirect_to trips_path
        else
            render :new
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
