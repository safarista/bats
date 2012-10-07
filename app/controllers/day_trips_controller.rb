class DayTripsController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :show]
  # GET /day_trips
  # GET /day_trips.json
  def index
    @day_trips = DayTrip.all
    @title = 'One Day trips and short holidays'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @day_trips }
    end
  end

  # GET /day_trips/1
  # GET /day_trips/1.json
  def show
    @day_trip = DayTrip.find(params[:id])
    @title = "#{@day_trip.title} trips"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @day_trip }
    end
  end

  # GET /day_trips/new
  # GET /day_trips/new.json
  def new
    @day_trip = DayTrip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @day_trip }
    end
  end

  # GET /day_trips/1/edit
  def edit
    @day_trip = DayTrip.find(params[:id])
  end

  # POST /day_trips
  # POST /day_trips.json
  def create
    @day_trip = DayTrip.new(params[:day_trip])

    respond_to do |format|
      if @day_trip.save
        format.html { redirect_to @day_trip, notice: 'Day trip was successfully created.' }
        format.json { render json: @day_trip, status: :created, location: @day_trip }
      else
        format.html { render action: "new" }
        format.json { render json: @day_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /day_trips/1
  # PUT /day_trips/1.json
  def update
    @day_trip = DayTrip.find(params[:id])

    respond_to do |format|
      if @day_trip.update_attributes(params[:day_trip])
        format.html { redirect_to @day_trip, notice: 'Day trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @day_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_trips/1
  # DELETE /day_trips/1.json
  def destroy
    @day_trip = DayTrip.find(params[:id])
    @day_trip.destroy

    respond_to do |format|
      format.html { redirect_to day_trips_url }
      format.json { head :no_content }
    end
  end
end
