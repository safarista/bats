class DestinationsController < ApplicationController
  # GET /destinations
  # GET /destinations.json
  def index
    @destineable  = find_destineable
    @destinations = @destineable.destinations
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destinations }
    end
  end
  # 
  # # GET /destinations/1
  # # GET /destinations/1.json
  def show
    @destination = Destination.find(params[:id])
    @destineable = find_destineable
  # @destination = @destineable.destinations.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @destination }
    end
  end
  # 
  # # GET /destinations/new
  # # GET /destinations/new.json
  # def new
  #   @destination = Destination.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @destination }
  #   end
  # end
  # 
  # # GET /destinations/1/edit
  def edit
    # @destination  = Destination.find(params[:id])
    @destineable  = find_destineable# .find(params[:safari_id])
    @destination  = @destineable.destinations.find(params[:id])
    # flash[:alert] = 'You cannot edit a comment, Just ask the owner of the discussion to delete it.'
    # redirect_to @destineable
  end
  # 
  # # POST /destinations
  # # POST /destinations.json
  # def create
  #   @destination = Destination.new(params[:destination])
  # 
  #   respond_to do |format|
  #     if @destination.save
  #       format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
  #       format.json { render json: @destination, status: :created, location: @destination }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @destination.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /destinations/1
  # # PUT /destinations/1.json
  # def update
  #   @destination = Destination.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @destination.update_attributes(params[:destination])
  #       format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @destination.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /destinations/1
  # # DELETE /destinations/1.json
  # def destroy
  #   @destination = Destination.find(params[:id])
  #   @destination.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to destinations_url }
  #     format.json { head :no_content }
  #   end
  # end
  
  def create
    @destineable = find_destineable
    @destination = @destineable.destinations.create(params[:destination])
    if @destination.save
      redirect_to :back, :notice => 'Destination was successfully added.'
    else
      flash[:error] = 'You cannot post an empty destination.'
      redirect_to :back
    end
  end


  private
  
  def find_destineable
    params.each_with_index do |name, value|
      if value == params.length - 1
        if name[0].to_s =~ /(.+)_id$/
          return $1.classify.constantize.find(name[1])
        end
      end
    end
    nil
  end
end
