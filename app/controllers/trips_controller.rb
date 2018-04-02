class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :edit, :update]

    def index
        @trips = Trip.all.where(user: current_user)
        respond_to do |f|
            f.html {render :index}
            f.json { render json: @trips}
        end
    end

    def show
        @item = @trip.items.build

        respond_to do |format|
            format.html { render :show }
            format.json { render json: @trip}
        end
    end

    def next
        next_id = Trip.find(params[:id]).next_id
        @trip = Trip.find(next_id)
        render json: @trip
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
            render json: @trip
        end
    end

  def destroy
    @trip = Trip.find(params[:id]).destroy
    redirect_to trips_url
  end


  private

    def set_trip
        @trip = Trip.find(params[:id])
    end

    def trip_params
        params.require(:trip).permit(:name, :duration, :start_date, :status, :item_ids => [], items_attributes: [:name])
    end

end
